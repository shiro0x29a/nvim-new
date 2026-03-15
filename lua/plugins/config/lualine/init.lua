--[[
local lualine = require('lualine')
local components = require('plugins.config.lualine.components')

lualine.setup {
  theme = 'auto',
  globalstatus = true,
  sections = {
    lualine_a = { 'mode' },
    lualine_b = {
      components.branch,
      components.diff,
      'diagnostics',
      -- 'searchcount',
      components.search_result,
    },
    lualine_c = {},
    lualine_x = {
      components.active_lsp,
      components.encoding,
      'filetype',
      components.active_ts,
    },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
--]]

require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'catppuccin',
    component_separators = '',
    section_separators = '',
    globalstatus = true,
  },
  sections = {
    lualine_a = { { 'filename', file_status = false } },
    lualine_b = {},
    lualine_c = {},
    lualine_x = { '' },
    -- lualine_y = {},
    lualine_y = { 'location' },
    lualine_z = { 'progress' },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { { 'filename', file_status = false } },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
}
