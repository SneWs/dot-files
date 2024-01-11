return {
  {
    "savq/melange-nvim",
    lazy = false,
    name = "melange",
    priority = 1000,
    config = function()
        vim.opt.termguicolors = true
        vim.cmd.colorscheme "melange"
    end
  }
}
