local M = {}

M.initialize_lazy = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/lazy/lazy.nvim'

  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--filter=blob:none', 'https://github.com/folke/lazy.nvim.git', '--branch=stable', install_path})
    return true
  end

  return false
end

M.get_buf_option = function(opt)
  local status_ok, buf_option = pcall(vim.api.nvim_buf_get_option, 0, opt)
  if not status_ok then
    return nil
  else
    return buf_option
  end
end

M.is_empty = function(s)
  return s == nil or s == ''
end

return M
