return {
{
	"nvim-treesitter/nvim-treesitter", 
	branch = 'master', 
	lazy = false, 
	build = ":TSUpdate",
	config = function()
	  require("nvim-treesitter.configs").setup {
		nsure_installed = { "javascript", "typescript", "tsx", "html", "css"},
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
		indent = { enable = true },
    textobjects = {
      move = {
        enable = true,
        set_jumps = true,
        goto_next_start = {
          ["]]"] = "@class.outer", -- Jump to next class start
          ["]m"] = "@function.outer", -- Jump to next function start
          ["]l"] = "@loop.outer", -- Jump to next loop start
        },
        goto_previous_start = {
          ["[["] = "@class.outer", -- Jump to previous class start
          ["[m"] = "@function.outer", -- Jump to previous function start
          ["[l"] = "@loop.outer", -- Jump to previous loop start
        },
        goto_next_end = {
          ["}]"] = "@class.outer", -- Jump to next class end
          ["}m"] = "@function.outer", -- Jump to next function end
        },
        goto_previous_end = {
          ["{["] = "@class.outer", -- Jump to previous class end
          ["{m"] = "@function.outer", -- Jump to previous function end
        },
      },
        },
        dependencies = {
          "nvim-treesitter/nvim-treesitter-textobjects",
        }
      }
    end
  }
}
