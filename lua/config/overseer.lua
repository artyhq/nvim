local overseer = require("overseer")
local notify = require("notify")
local M = {}

overseer.setup({
  task_list = {
    direction = "bottom",
    min_height = 8,
    max_height = 20,
    bindings = {
      ["q"] = "Close",
      ["<CR>"] = "OpenOutput",
      ["r"] = "Restart",
      ["k"] = "Kill",
    },
  },
  form = { border = "single" },
  confirm = { border = "single" },
  task_win = { border = "single" },
  templates = { "builtin" },
  default_template = {
    builder = function(params)
      return {
        cmd = params.cmd,
        env = params.env,
      }
    end,
  },
})

-- Hooks: notify on complete/failure and push to quickfix on failure
overseer.on("task_complete", function(task)
  local status = task.status
  if status == "SUCCESS" then
    notify("Task '" .. task.name .. "' finished successfully", "info", { title = "Overseer" })
  elseif status == "FAILURE" then
    notify("Task '" .. task.name .. "' failed", "error", { title = "Overseer" })
    local results = task:result()
    if results then
      local qf = {}
      for _, r in ipairs(results) do
        if r.filename and r.lnum then
          table.insert(qf, { filename = r.filename, lnum = r.lnum, col = r.col or 1, text = r.message or "" })
        end
      end
      if #qf > 0 then
        vim.fn.setqflist({}, ' ', { title = 'Overseer', items = qf })
        vim.cmd("copen")
      end
    end
  end
end)

-- Simple helper to create quick shell tasks
function M.run_shell(cmd, name, opts)
  opts = opts or {}
  local task = overseer.new_task({
    name = name or cmd,
    builder = function()
      return {
        cmd = {"/bin/sh", "-c", cmd},
        entries = {
          { "on_output", function(_, line)
              -- pass
            end
          }
        }
      }
    end,
  })
  task:start()
  return task
end

-- Load project-level overseer config if present
local function load_project_overseer()
  local cwd = vim.fn.getcwd()
  local project_conf = cwd .. "/.overseer.lua"
  if vim.loop.fs_stat(project_conf) then
    dofile(project_conf)
  end
end

load_project_overseer()

-- Expose helper to be used by keymaps
_G.OverseerRunShell = function()
  vim.ui.input({ prompt = "Overseer: shell command> " }, function(input)
    if not input or input == "" then return end
    M.run_shell(input, input)
  end)
end

return M
