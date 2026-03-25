require('plugins.disable_builtins')

local utils = require('utils')
local plugin_list = require('plugins.plugin_list')

local lazy_bootstrap = utils.initialize_lazy()
local lazy_path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

local fn = vim.fn
if fn.empty(fn.glob(lazy_path)) > 0 then
  return
end

vim.opt.rtp:prepend(lazy_path)

local status_ok, lazy = pcall(require, 'lazy')

if status_ok then
  local plugins = {}
  for key, plugin in pairs(plugin_list) do
    if type(key) == 'string' and not plugin[1] then
      plugin[1] = key
    end
    table.insert(plugins, plugin)
  end

  -- Add AI plugins
  local ai_plugins = require('plugins.config.ai')
  for _, plugin in ipairs(ai_plugins) do
    table.insert(plugins, plugin)
  end

  lazy.setup(plugins, {
    install = {
      colorscheme = { 'catppuccin' },
    },
  })

  if lazy_bootstrap then
    lazy.sync()
  end
end

