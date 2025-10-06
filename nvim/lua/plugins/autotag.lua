return {
{
    "windwp/nvim-ts-autotag",
    ft = { "html", "javascript", "typescript", "javascriptreact", "typescriptreact", "vue", "xml" },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  }
}
