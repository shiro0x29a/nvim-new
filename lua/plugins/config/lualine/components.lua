local conditions = require('plugins.config.lualine.conditions')
local icons = require('icons')
local colors = require('lualine.themes.gruvbox')

return {
  options = { theme = 'gruvbox' },

  branch = {
    'branch',
    icon = icons.git.Branch
  },

  diff = {
    'diff',
    symbols = {
      added = icons.git.LineAdded .. ' ',
      modified = icons.git.LineModified .. ' ',
      removed = icons.git.LineRemoved .. ' '
    },
    cond = conditions.hide_in_width,
  },

  encoding = {
    'encoding',
    fmt = string.upper,
    color = {},
  },

  search_result = {
    function()
      if vim.v.hlsearch == 0 then
        return ''
      end

      local last_search = vim.fn.getreg('/')

      if not last_search or last_search == '' then
        return ''
      end

      local searchcount = vim.fn.searchcount { maxcount = 9999 }

      return last_search .. ' (' .. searchcount.current .. '/' .. searchcount.total .. ')'
    end
  },

  active_ts = {
    function()
      return icons.ui.Tree
    end,

    color = function()
      local buf = vim.api.nvim_get_current_buf()
      local ts = vim.treesitter.highlighter.active[buf]
      return { fg = ts and not vim.tbl_isempty(ts) and colors.normal.a.bg or colors.normal.c.bg }
    end,

    cond = conditions.hide_in_width,
  },

  active_lsp = {
    function()
      local msg = 'No Active Lsp'
      local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
      local clients = vim.lsp.get_active_clients()

      if next(clients) == nil then
        return msg
      end

      for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
          return client.name
        end
      end

      return msg
    end,
    icon = icons.ui.ActiveLsp
  },
}
