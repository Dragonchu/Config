-- always set leader first!
vim.keymap.set("n", "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "
-- quick-open
vim.keymap.set('', '<C-p>', '<cmd>Files<cr>')
-- quick-save
vim.keymap.set('n', '<leader>w', '<cmd>w<cr>')
-- open new file adjacent to current file
vim.keymap.set('n', '<leader>o', ':e <C-R>=expand("%:p:h") . "/" <cr>')
-- make j and k move by visual line, not actual line, when text is soft-wrapped
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
-- <leader><leader> toggles between buffers
vim.keymap.set('n', '<leader><leader>', '<c-^>')
-- leap
vim.keymap.set({'n', 'x', 'o'}, 's', '<Plug>(leap)')
-- ctrlsf
-- 普通模式映射
vim.keymap.set('n', '<C-F>f', '<Plug>CtrlSFPrompt')
vim.keymap.set('n', '<C-F>n', '<Plug>CtrlSFCwordPath') 
vim.keymap.set('n', '<C-F>p', '<Plug>CtrlSFPwordPath')
vim.keymap.set('n', '<C-F>o', ':CtrlSFOpen<CR>')
vim.keymap.set('n', '<C-F>t', ':CtrlSFToggle<CR>')

-- 可视模式映射
vim.keymap.set('v', '<C-F>f', '<Plug>CtrlSFVwordPath')
vim.keymap.set('v', '<C-F>F', '<Plug>CtrlSFVwordExec')

-- 插入模式映射
vim.keymap.set('i', '<C-F>t', '<Esc>:CtrlSFToggle<CR>')

