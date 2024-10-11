return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    transparent_background = true, -- disables setting the background color.
    show_end_of_buffer = false,
    style = "storm",
    transparent = true,
    terminal_colors = false,
    config = function()
        vim.opt.termguicolors = false
        vim.cmd.colorscheme "tokyonight-night"
    end
  }
}
