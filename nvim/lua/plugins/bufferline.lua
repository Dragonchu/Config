return {
  {
    "akinsho/bufferline.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      local bufferline = require("bufferline")

      bufferline.setup({
        options = {
          numbers = "ordinal",             -- 显示 buffer 序号
          close_command = "bdelete! %d",   -- 关闭 buffer
          right_mouse_command = "bdelete! %d",
          left_trunc_marker = "",
          right_trunc_marker = "",
          max_name_length = 30,
          max_prefix_length = 15,
          tab_size = 20,
          diagnostics = "nvim_lsp",        -- 显示 LSP 错误
          diagnostics_update_in_insert = false,
          offsets = {
            {
              filetype = "NvimTree",
              text = "Explorer",
              highlight = "Directory",
              text_align = "center",
            },
          },
          show_buffer_icons = true,        -- 显示文件类型图标
          show_buffer_close_icons = true,  -- 显示关闭按钮
          show_close_icon = true,
          show_tab_indicators = true,
          persist_buffer_sort = true,
          separator_style = "thin",        -- 分隔符风格，可选 "slant" / "thick"
          enforce_regular_tabs = false,
          always_show_bufferline = true,
          sort_by = "id",
        },
        highlights = {
          -- 高亮当前 buffer
          buffer_selected = {
            italic = false,
            bold = true,
          },
          -- 高亮 LSP 错误
          diagnostic_selected = {
            fg = "#ff0000",
          },
        },
      })

      -- 快捷键示例
      vim.keymap.set("n", "<TAB>", ":BufferLineCycleNext<CR>", { desc = "Next buffer" })
      vim.keymap.set("n", "<S-TAB>", ":BufferLineCyclePrev<CR>", { desc = "Prev buffer" })
      vim.keymap.set("n", "<leader>c", ":bdelete<CR>", { desc = "Close buffer" })

      -- 快速跳转 buffer 1~9
      for i = 1, 9 do
        vim.keymap.set("n", "<leader>" .. i, ":BufferLineGoToBuffer " .. i .. "<CR>")
      end
    end,
  },
  {
    "nvim-tree/nvim-web-devicons", -- 图标支持
    lazy = true,
  },
}

