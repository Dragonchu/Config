return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      require("config.lsp") -- 模块化加载
    end,
  },
}

