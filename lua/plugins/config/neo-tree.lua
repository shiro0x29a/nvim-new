local neotree = require('neo-tree')
local icons = require('icons')

neotree.setup {
  enable_diagnostics = false,
  source_selector = {
    winbar = true,
    content_layout = 'center',
  },
  filesystem = {
    follow_current_file = true,
    use_libuv_file_watcher = true,
    show_parent_path = true,
    visible = true,
    commands = {
      avante_add_files = function(state)
        local node = state.tree:get_node()
        local filepath = node:get_id()
        local relative_path = require('avante.utils').relative_path(filepath)

        local sidebar = require('avante').get()

        local open = sidebar:is_open()
        -- ensure avante sidebar is open
        if not open then
          require('avante.api').ask()
          sidebar = require('avante').get()
        end

        sidebar.file_selector:add_selected_file(relative_path)

        -- remove neo tree buffer
        if not open then
          sidebar.file_selector:remove_selected_file('neo-tree filesystem [1]')
        end
      end,
    },
    window = {
      mappings = {
        ['oa'] = 'avante_add_files',
      },
    },
  },
  buffers = {
    follow_current_file = true,
  },
  window = {
    mappings = {
      ['J'] = 'prev_source',
      ['K'] = 'next_source',
    }
  },
  default_component_configs = {
    git_status = {
      symbols = {
        -- Change type
        added     = '',
        modified  = '',
        deleted   = icons.git.FileDeleted,
        renamed   = icons.git.FileRenamed,
        -- Status type
        untracked = icons.git.FileUntracked,
        ignored   = icons.git.FileIgnored,
        unstaged  = icons.git.FileUnstaged,
        staged    = icons.git.FileStaged,
        conflict  = icons.git.Branch,
      },
    },
  },
}
