return {
	{
    -- 文件类型支持 JS/JSX/TS/TSX
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    cmd = { "ts_ls" },  -- 确保全局 npm 安装了 tsserver: npm install -g typescript typescript-language-server
    on_attach = function(client, bufnr)
        -- 禁用 tsserver 内置格式化，由 Prettier 接管
        client.server_capabilities.documentFormattingProvider = false
    end,
}
}
