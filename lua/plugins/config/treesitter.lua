local treesitter_ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not treesitter_ok then
  return
end

treesitter.setup {
  ensure_installed = {
    'bash',
    'c',
    'c_sharp',
    'cmake',
    'comment',
    'commonlisp',
    'cpp',
    'css',
    'cuda',
    'diff',
    'dockerfile',
    'gitattributes',
    'go',
    'gomod',
    'gowork',
    'graphql',
    'hjson',
    'hlsl',
    'html',
    'http',
    'java',
    'javascript',
    'jsdoc',
    'json',
    'json5',
    'jsonc',
    -- 'latex', -- Requires tree-sitter CLI to generate grammar
    'llvm',
    'lua',
    'make',
    'markdown',
    'markdown_inline',
    'ninja',
    'prisma',
    'pug',
    'python',
    'qmljs',
    'regex',
    'rust',
    'scss',
    'solidity',
    'sql',
    'svelte',
    'todotxt',
    'tsx',
    'typescript',
    'vim',
    'vue',
    'wgsl',
    'yaml',
  },

  -- sync_install = false,
  -- auto_install = true,

  disable = function(_, buf)
    local max_filesize = 100 * 1024 -- 100 KB
    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
    if ok and stats and stats.size > max_filesize then
      return true
    end
  end,

  highlight = {
    enable = true
  },

  indent = {
    enable = true
  },

  autotag = {
    enable = true
  },

  textobjects = {
    select = {
      enable = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["<leader>af"] = "@function.outer",
        ["<leader>if"] = "@function.inner",
        ["<leader>ac"] = "@class.outer",
        -- You can optionally set descriptions to the mappings (used in the desc parameter of
        -- nvim_buf_set_keymap) which plugins like which-key display
        ["<leader>ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
      },
    }
  }
}
