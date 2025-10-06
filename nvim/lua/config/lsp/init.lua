local lspconfig = require("lspconfig")

-- 获取当前文件所在目录
local lsp_dir = vim.fn.stdpath("config") .. "/lua/config/lsp"

-- 列出目录下的所有 .lua 文件（不包括 init.lua）
local files = vim.fn.globpath(lsp_dir, "*.lua", false, true)

for _, file in ipairs(files) do
  local filename = vim.fn.fnamemodify(file, ":t:r")  -- 取文件名不带路径和扩展名
  if filename ~= "init" then
    local ok, conf = pcall(require, "config.lsp." .. filename)
    if ok then
      lspconfig[filename].setup(conf)
    else
      vim.notify("Failed to load LSP config for " .. filename .. ": " .. conf)
    end
  end
end

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
		vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
		vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set('n', '<leader>wl', function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		--vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
		vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, opts)
		vim.keymap.set({ 'n', 'v' }, '<leader>a', vim.lsp.buf.code_action, opts)
		vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
		vim.keymap.set('n', '<leader>=', function()
			vim.lsp.buf.format { async = true }
		end, opts)

		local client = vim.lsp.get_client_by_id(ev.data.client_id)

		-- When https://neovim.io/doc/user/lsp.html#lsp-inlay_hint stabilizes
		-- *and* there's some way to make it only apply to the current line.
		-- if client.server_capabilities.inlayHintProvider then
		--     vim.lsp.inlay_hint(ev.buf, true)
		-- end

		-- None of this semantics tokens business.
		-- https://www.reddit.com/r/neovim/comments/143efmd/is_it_possible_to_disable_treesitter_completely/
		client.server_capabilities.semanticTokensProvider = nil
	end,
})

