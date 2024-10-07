vim.g.mapleader = " "

-- Clipboard - Make sure to always sync with OS clipboard
vim.opt.clipboard = 'unnamedplus'

-- Set highlight on search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.scrolloff = 12
vim.opt.signcolumn = "no"

vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
vim.opt.colorcolumn = "100"

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.expand('~/.vim/undodir')
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

require("nvim-dap-projects").search_project_config()

vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "<leader>i", vim.lsp.buf.definition)
vim.keymap.set("n", "<leader>R", vim.lsp.buf.references, {})
vim.keymap.set("n", "<leader>I", vim.lsp.buf.implementation)
vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition)
vim.keymap.set("n", "<leader>ds", require("telescope.builtin").lsp_document_symbols)
vim.keymap.set("n", "<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols)
vim.api.nvim_set_keymap("i", "<C-s>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", {})

-- Make use of jump list to navigate between locations quickly
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>", { noremap = true })
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>", { noremap = true })

-- Fugitive git helpers
vim.keymap.set("n", "<leader>D", "<cmd>Gvdiff<CR>", { noremap = true })
