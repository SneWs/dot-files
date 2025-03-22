return {
	{
		"nvim-neo-tree/neo-tree.nvim",
	    keys = {
	      { "<leader>ft", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
	    },
	    dependencies = {
	      "nvim-lua/plenary.nvim",
	      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
	      "MunifTanjim/nui.nvim",
	    },
	    config = function()
	      require("neo-tree").setup({
              filesystem = {
                  filtered_items = {
                      visible = true,
                      hide_dotfiles = false,
                      hide_gitignored = false
                  },
                  follow_current_file = { enabled = true },
              },
          })
	    end
    }
}
