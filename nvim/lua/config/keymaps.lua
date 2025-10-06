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
