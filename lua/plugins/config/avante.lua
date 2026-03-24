require('avante').setup({
  provider = 'qwen-code',
  auto_suggestions_provider = nil,
  -- auto_suggestions_provider = 'qwen',
  mode = 'agentic',

  acp_providers = {
    ["qwen-code"] = {
      command = "qwen",
      args = { "--acp" },  -- ACP режим если поддерживается
      -- Альтернативно, если ACP не поддерживается, используйте pipe режим
      -- args = { "--stdio" },
      env = {
        DASHSCOPE_API_KEY = os.getenv("DASHSCOPE_API_KEY"),
        -- Для scoped ключа
        -- AVANTE_DASHSCOPE_API_KEY = os.getenv("AVANTE_DASHSCOPE_API_KEY"),
      },
    },
  },

  providers = {
    -- ==================== FREE PROVIDERS ====================
    ollama = {
      endpoint = 'http://localhost:11434',
      model = 'qwen3.5',
      timeout = 120000,
      extra_request_body = {
        options = {
          temperature = 0.75,
          num_ctx = 8192,
          keep_alive = '5m',
        },
      },
    },

    gemini = {
      endpoint = 'https://generativelanguage.googleapis.com/v1beta/models',
      -- model = 'gemini-3-flash-preview',
      model = 'gemini-2.5-flash',
      timeout = 30000,
    },

    mistral = {
      endpoint = 'https://api.mistral.ai/v1',
      model = 'mistral-small-latest',
      timeout = 30000,
    },
    
    qwen = {
      endpoint = 'https://dashscope-intl.aliyuncs.com/compatible-mode/v1',
      model = 'qwen3-coder-plus',
      timeout = 30000,
      api_key_name = "DASHSCOPE_API_KEY",
    },

    glm = {
      endpoint = 'https://open.bigmodel.cn/api/coding/paas/v4',
      model = 'GLM-4.7',
      timeout = 30000,
    },

    -- ==================== PAID PROVIDERS ====================
    copilot = {
      endpoint = 'https://api.githubcopilot.com',
      model = 'gpt-4o',
      auth_type = 'oauth',
      timeout = 30000,
    },

    openai = {
      endpoint = 'https://api.openai.com/v1',
      model = 'gpt-4o-mini',
      timeout = 30000,
    },

    claude = {
      endpoint = 'https://api.anthropic.com',
      model = 'claude-3-5-sonnet-20241022',
      timeout = 30000,
    },

    bedrock = {
      model = 'us.anthropic.claude-3-5-sonnet-20241022-v2:0',
      aws_region = 'us-east-1',
      timeout = 30000,
    },

    vertex = {
      model = 'gemini-2.0-flash',
      timeout = 30000,
    },

    cohere = {
      endpoint = 'https://api.cohere.ai',
      model = 'command-r-plus',
      timeout = 30000,
    },

    -- ==================== OTHER PROVIDERS ====================
    aihubmix = {
      __inherited_from = 'openai',
      endpoint = 'https://aihubmix.com/v1',
      model = 'gpt-4o-2024-11-20',
    },

    aihubmix_claude = {
      __inherited_from = 'claude',
      endpoint = 'https://aihubmix.com',
      model = 'claude-3-7-sonnet-20241022',
    },

    morph = {
      __inherited_from = 'openai',
      endpoint = 'https://api.morphllm.com/v1',
      model = 'morph-v3-large',
    },

    moonshot = {
      __inherited_from = 'openai',
      endpoint = 'https://api.moonshot.ai/v1',
      model = 'kimi-k2-0711-preview',
    },

    xai = {
      __inherited_from = 'openai',
      endpoint = 'https://api.x.ai/v1',
      model = 'grok-code-fast-1',
    },
  },

  behaviour = {
    auto_suggestions = false, -- Experimental stage
    auto_set_highlight_group = true,
    auto_set_keymaps = true,
    auto_apply_diff_after_generation = false,
    support_paste_from_clipboard = false,
    minimize_diff = true, -- Whether to remove unchanged lines when applying a code block
    enable_token_counting = true, -- Whether to enable token counting. Default to true.
    auto_add_current_file = true, -- Whether to automatically add the current file when opening a new chat. Default to true.
    auto_approve_tool_permissions = {"bash"}, -- Auto-approve specific tools only
    -- auto_approve_tool_permissions = true, -- Default: auto-approve all tools (no prompts)
    -- Examples:
    -- auto_approve_tool_permissions = false,                -- Show permission prompts for all tools
    -- auto_approve_tool_permissions = {"bash", "str_replace"}, -- Auto-approve specific tools only
    ---@type "popup" | "inline_buttons"
    confirmation_ui_style = "inline_buttons",
    --- Whether to automatically open files and navigate to lines when ACP agent makes edits
    ---@type boolean
    acp_follow_agent_locations = true,
  },
  -- behaviour = {
  --   auto_suggestions = false,
  --   auto_apply = false,
  --   auto_set_highlight_group = true,
  --   auto_set_keymaps = true,
  -- },
  prompt_logger = { -- logs prompts to disk (timestamped, for replay/debugging)
    enabled = true, -- toggle logging entirely
    log_dir = vim.fn.stdpath("cache") .. "/avante_prompts", -- directory where logs are saved
    fortune_cookie_on_success = false, -- shows a random fortune after each logged prompt (requires `fortune` installed)
    next_prompt = {
      normal = "<C-n>", -- load the next (newer) prompt log in normal mode
      insert = "<C-n>",
    },
    prev_prompt = {
      normal = "<C-p>", -- load the previous (older) prompt log in normal mode
      insert = "<C-p>",
    },
  },
  mappings = {
    --- @class AvanteConflictMappings
    diff = {
      ours = "co",
      theirs = "ct",
      all_theirs = "ca",
      both = "cb",
      cursor = "cc",
      next = "]x",
      prev = "[x",
    },
    suggestion = {
      accept = "<M-l>",
      next = "<M-]>",
      prev = "<M-[>",
      dismiss = "<C-]>",
    },
    jump = {
      next = "]]",
      prev = "[[",
    },
    submit = {
      normal = "<CR>",
      insert = "<C-s>",
    },
    cancel = {
      normal = { "<C-c>", "<Esc>", "q" },
      insert = { "<C-c>" },
    },
    sidebar = {
      apply_all = "A",
      apply_cursor = "a",
      retry_user_request = "r",
      edit_user_request = "e",
      switch_windows = "<Tab>",
      reverse_switch_windows = "<S-Tab>",
      remove_file = "d",
      add_file = "@",
      close = { "<Esc>", "q" },
      close_from_input = nil, -- e.g., { normal = "<Esc>", insert = "<C-d>" }
    },
  },
  selection = {
    enabled = true,
    hint_display = "delayed",
  },
  windows = {
    ---@type "right" | "left" | "top" | "bottom"
    position = "right", -- the position of the sidebar
    wrap = true, -- similar to vim.o.wrap
    width = 30, -- default % based on available width
    sidebar_header = {
      enabled = true, -- true, false to enable/disable the header
      align = "center", -- left, center, right for title
      rounded = true,
    },
    spinner = {
      editing = { "⡀", "⠄", "⠂", "⠁", "⠈", "⠐", "⠠", "⢀", "⣀", "⢄", "⢂", "⢁", "⢈", "⢐", "⢠", "⣠", "⢤", "⢢", "⢡", "⢨", "⢰", "⣰", "⢴", "⢲", "⢱", "⢸", "⣸", "⢼", "⢺", "⢹", "⣹", "⢽", "⢻", "⣻", "⢿", "⣿" },
      generating = { "·", "✢", "✳", "∗", "✻", "✽" }, -- Spinner characters for the 'generating' state
      thinking = { "🤯", "🙄" }, -- Spinner characters for the 'thinking' state
    },
    input = {
      prefix = "> ",
      height = 8, -- Height of the input window in vertical layout
    },
    edit = {
      border = "rounded",
      start_insert = true, -- Start insert mode when opening the edit window
    },
    ask = {
      floating = false, -- Open the 'AvanteAsk' prompt in a floating window
      start_insert = true, -- Start insert mode when opening the ask window
      border = "rounded",
      ---@type "ours" | "theirs"
      focus_on_apply = "ours", -- which diff to focus after applying
    },
  },
  highlights = {
    ---@type AvanteConflictHighlights
    diff = {
      current = "DiffText",
      incoming = "DiffAdd",
    },
  },
  --- @class AvanteConflictUserConfig
  diff = {
    autojump = true,
    ---@type string | fun(): any
    list_opener = "copen",
    --- Override the 'timeoutlen' setting while hovering over a diff (see :help timeoutlen).
    --- Helps to avoid entering operator-pending mode with diff mappings starting with `c`.
    --- Disable by setting to -1.
    override_timeoutlen = 500,
  },
  suggestion = {
    debounce = 600,
    throttle = 600,
  },
})
--   mappings = {
--     diff = {
--       ours = 'co',
--       theirs = 'ct',
--       all_theirs = 'ca',
--       both = 'cb',
--       cursor = 'cc',
--       next = ']x',
--       prev = '[x',
--     },
--     suggestion = {
--       accept = '<M-l>',
--       next = '<M-]>',
--       prev = '<M-[>',
--       dismiss = '<C-]>',
--     },
--     jump = {
--       next = ']]',
--       prev = '[[',
--     },
--     submit = {
--       normal = '<CR>',
--       insert = '<C-s>',
--     },
--     sidebar = {
--       retry_user_request = 'r',
--       edit_user_request = 'e',
--       toggle_code_window = 'x',
--       close = { 'q' },
--     },
--   },
--   hints = { enabled = true },
--   windows = {
--     position = 'right',
--     wrap = true,
--     width = 40,
--     sidebar_header = {
--       align = 'center',
--       rounded = true,
--     },
--   },
--   highlights = {
--     diff = {
--       incoming = 'DiffAdd',
--       our = 'DiffChange',
--     },
--   },
--   diff = {
--     autojump = true,
--   },
-- })
