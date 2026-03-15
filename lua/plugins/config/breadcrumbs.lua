local navic = require('nvim-navic')
local icons = require('icons')
local webdev_icons = require('nvim-web-devicons')
local utils = require('utils')

local M = {}

M.winbar_filetype_exclude = {
  'help',
  'startify',
  'dashboard',
  'lazy',
  'neogitstatus',
  'NvimTree',
  'Trouble',
  'alpha',
  'lir',
  'Outline',
  'spectre_panel',
  'toggleterm',
}

local excludes = function()
  if vim.tbl_contains(M.winbar_filetype_exclude, vim.bo.filetype) then
    vim.opt_local.winbar = nil
    return true
  end
  return false
end

local function get_filename()
  local filename = vim.fn.expand('%:t')
  local extension = vim.fn.expand('%:e')

  local file_icon, file_icon_color = webdev_icons.get_icon_color(filename, extension, { default = true })
  local hl_group = 'FileIconColor' .. extension

  vim.api.nvim_set_hl(0, hl_group, { fg = file_icon_color })

  if utils.is_empty(file_icon) then
    file_icon = icons.kind.File
  end

  if utils.is_empty(filename) then
    filename = 'Untitled'

    return ' '
        .. '%#'
        .. hl_group
        .. '#'
        .. file_icon
        .. '%*'
        .. ' '
        .. '%#Winbar#'
        .. filename
        .. '%*'
  end

  local sep = vim.loop.os_uname().sysname == 'Windows' and '\\' or '/'
  local path_list = vim.split(string.gsub(vim.fn.expand '%:~:.:h', '%%', ''), sep)
  local file_path = ''

  for _, cur in ipairs(path_list) do
    file_path = (cur == '.' or cur == '~') and '' or
        file_path .. cur .. ' ' .. '%#LspSagaWinbarSep#>%*' .. ' %*'
  end

  -- local mod = ''
  -- if utils.get_buf_option('mod') then
  --   mod = icons.git.FileUnstaged
  -- end

  return ' '
      .. file_path
      .. '%#'
      .. hl_group
      .. '#'
      .. file_icon
      .. '%*'
      .. ' '
      .. '%#Winbar#'
      .. filename
      .. '%*'
  -- .. mod
end

local function get_location()
  local location = navic.get_location()

  if not utils.is_empty(location) then
    return '%#WinBarContext#' .. ' ' .. icons.ui.ChevronRight .. ' ' .. location .. '%*'
  end

  return ''
end

function M.get_winbar()
  if excludes() then
    return ''
  end

  if navic.is_available() then
    return '%#WinBarSeparator#'
        .. get_filename()
        .. get_location()
        .. '%#WinBarSeparator#'
        .. '%*'
  else
    return '%#WinBarSeparator#' .. '%*' .. get_filename() .. '%#WinBarSeparator#' .. '%*'
  end
end

vim.opt.winbar = "%{%v:lua.require'plugins.config.breadcrumbs'.get_winbar()%}"

navic.setup {
  highlight = true,
  separator = ' ' .. icons.ui.ChevronRight .. ' ',
  depth_limit = 0,
  depth_limit_indicator = '..',

  icons = {
    Array = icons.kind.Array .. ' ',
    Boolean = icons.kind.Boolean,
    Class = icons.kind.Class .. ' ',
    Color = icons.kind.Color .. ' ',
    Constant = icons.kind.Constant .. ' ',
    Constructor = icons.kind.Constructor .. ' ',
    Enum = icons.kind.Enum .. ' ',
    EnumMember = icons.kind.EnumMember .. ' ',
    Event = icons.kind.Event .. ' ',
    Field = icons.kind.Field .. ' ',
    File = icons.kind.File .. ' ',
    Folder = icons.kind.Folder .. ' ',
    Function = icons.kind.Function .. ' ',
    Interface = icons.kind.Interface .. ' ',
    Key = icons.kind.Key .. ' ',
    Keyword = icons.kind.Keyword .. ' ',
    Method = icons.kind.Method .. ' ',
    Module = icons.kind.Module .. ' ',
    Namespace = icons.kind.Namespace .. ' ',
    Null = icons.kind.Null .. ' ',
    Number = icons.kind.Number .. ' ',
    Object = icons.kind.Object .. ' ',
    Operator = icons.kind.Operator .. ' ',
    Package = icons.kind.Package .. ' ',
    Property = icons.kind.Property .. ' ',
    Reference = icons.kind.Reference .. ' ',
    Snippet = icons.kind.Snippet .. ' ',
    String = icons.kind.String .. ' ',
    Struct = icons.kind.Struct .. ' ',
    Text = icons.kind.Text .. ' ',
    TypeParameter = icons.kind.TypeParameter .. ' ',
    Unit = icons.kind.Unit .. ' ',
    Value = icons.kind.Value .. ' ',
    Variable = icons.kind.Variable .. ' ',
  },
}

return M
