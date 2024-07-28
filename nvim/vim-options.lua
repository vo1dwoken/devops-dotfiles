vim.g.mapleader = " "
vim.g.copilot_filetypes = {["*"] = false}
vim.api.nvim_set_option("clipboard", "unnamed")
vim.cmd([[
  set expandtab
  set tabstop=2
  set softtabstop=2
  set shiftwidth=2
  set relativenumber
  set number
  set clipboard+=unnamedplus
  set colorcolumn=80

  augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=200})
  augroup END

  augroup user_colors
  autocmd!
  autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
  augroup END

  let &t_SI = "\e[6 q"
  let &t_EI = "\e[2 q"
]])

-- center screen on these motions
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Create a custom command to clear search highlighting
vim.api.nvim_create_user_command('NoH', 'noh', {})

-- Map <leader>h to clear search highlighting
vim.api.nvim_set_keymap('n', '<leader>h', ':NoH<CR>', { noremap = true, silent = true })
