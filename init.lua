for _, source in ipairs {
  'plugins',
  'core.options',
  'core.mappings',
  'core.diagnostics',
  'local.home_or_word',
} do
  local status_ok, fault = pcall(require, source)

  if not status_ok then
    vim.api.nvim_err_writeln('Failed to load ' .. source .. '\n\n' .. fault)
  end
end

local colorscheme = 'catppuccin'

local status_ok, _ = pcall(require, colorscheme)
if status_ok then
  vim.cmd('colorscheme ' .. colorscheme)
  -- vim.cmd('set background=dark')
end
