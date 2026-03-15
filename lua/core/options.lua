local options = {
  wildignore = '*node_modules/**',
  ignorecase = true,
  smartcase = true,
  mouse = 'a',
  swapfile = false,
  cursorline = true,
  wrap = true,
  clipboard = 'unnamedplus',
  cmdheight = 0,
  completeopt = { 'menuone', 'noselect' },
  -- fileencoding = 'utf-8',
  fillchars = { eob = ' ' },
  lazyredraw = true,
  scrolloff = 8,
  sidescrolloff = 8,
  termguicolors = true,

  -- Indenting
  autoindent = true,
  copyindent = true,
  smartindent = true,
  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  expandtab = true,
  preserveindent = true,

  -- Numbers
  number = true,
  relativenumber = true,
  numberwidth = 2,
  ruler = false,

  -- Split 
  splitbelow = true,
  splitright = true,

  -- Fold
  foldcolumn = '1',
  foldlevel = 99 ,
  foldlevelstart = 99,
  foldenable = true,
  statusline = '%f%=%l,%c          %P',
}

local globals = {
  mapleader = ' ',
  loaded = 1,
  loaded_netrwPlugin = 1,
}

vim.cmd('autocmd BufEnter * set fo-=c fo-=r fo-=o')

for key, value in pairs(options) do
  vim.opt[key] = value
end

for key, value in pairs(globals) do
  vim.g[key] = value
end
