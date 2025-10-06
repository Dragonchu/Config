return {
{
	"nvim-treesitter/nvim-treesitter", 
	branch = 'master', 
	lazy = false, 
	build = ":TSUpdate",
	config = function()
	    require("nvim-treesitter.configs").setup {
		nsure_installed = { "javascript", "typescript", "tsx", "html", "css" },
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
		indent = { enable = true },
	}
	end
}
}
