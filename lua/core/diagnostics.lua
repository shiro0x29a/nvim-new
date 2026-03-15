local icons = require('icons')

-- set up LSP signs
local signs = {
  Error = icons.diagnostics.Error .. ' ',
  Warn = icons.diagnostics.Warning .. ' ',
  Hint = icons.diagnostics.Hint .. ' ',
  Info = icons.diagnostics.Information .. ' ',
}

for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
end

local function format(diagnostic)
  local icon = icons.diagnostics.Error

  if diagnostic.severity == vim.diagnostic.severity.WARN then
    icon = icons.diagnostics.Warning
  end

  if diagnostic.severity == vim.diagnostic.severity.HINT then
    icon = icons.diagnostics.Hint
  end

  local message = string.format(' %s [%s][%s] %s', icon, diagnostic.code, diagnostic.source, diagnostic.message)
  return message
end

-- set up vim.diagnostics
vim.diagnostic.config {
  underline = true,
  signs = true,
  update_in_insert = true,
  severity_sort = true,
  float = {
    focusable = false,
    header = { icons.diagnostics.Debug .. ' Diagnostics:', 'Normal' },
    scope = 'line',
    source = false,
    format = format,
  },
  virtual_text = {
    prefix = icons.git.FileUnstaged,
    spacing = 2,
    source = false,
    severity = {
      min = vim.diagnostic.severity.HINT,
    },
  },
}
