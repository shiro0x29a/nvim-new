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
