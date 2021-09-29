-- Install paq
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/paqs/start/paq-nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth=1', 'https://github.com/savq/paq-nvim.git', install_path})
end

-- Paq
require "paq" {
	"savq/paq-nvim";
	"shaunsingh/nord.nvim";
}

-- Nordtheme
vim.cmd 'colorscheme nord'

-- Custom settings
vim.o.tabstop     = 2
vim.o.softtabstop = 2
vim.o.shiftwidth  = 2
vim.o.colorcolumn = '81'
vim.o.expandtab   = true
vim.o.autoindent  = true
vim.cmd[[set encoding=utf8]]

-- Statusline
vim.cmd[[set statusline=]]
vim.cmd[[set statusline+=\ %F]]     -- Full file path
vim.cmd[[set statusline+=%=]]       -- Space
vim.cmd[[set statusline+=\ %y]]     -- Filetype
vim.cmd[[set statusline+=\ [%{&fileencoding}] ]]
vim.cmd[[set statusline+=\ %l:%c]]  -- Current line and character

-- Disable neovim plugins
local disabled_built_ins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "matchit",
  "tar",
  "tarPlugin",
  "rrhelper",
  "spellfile_plugin",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
}
