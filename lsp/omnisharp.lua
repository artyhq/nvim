return {
    cmd = { "OmniSharp", "--languageserver" },
    settings = {
        FormattingOptions = {
            EnableEditorConfigSupport = true,
        },
        RoslynExtensionsOptions = {
            EnableAnalyzersSupport = true,
            EnableImportCompletion = true,
        },
    },
}
