local lspconfig = require("lspconfig")
return {
{
    cmd = { "vscode-eslint", "--stdio" },
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    root_dir = lspconfig.util.root_pattern(".eslintrc.js", ".eslintrc.json", ".git"),
    on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = true
    end,
}
}
