require('avante').setup({
  provider = 'gemini',
  auto_suggestions_provider = 'gemini',

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
      endpoint = 'https://generativelanguage.googleapis.com',
      model = 'gemini-2.0-flash-exp',
      timeout = 30000,
    },

    mistral = {
      endpoint = 'https://api.mistral.ai/v1',
      model = 'mistral-small-latest',
      timeout = 30000,
    },

    qwen = {
      endpoint = 'https://dashscope.aliyuncs.com/compatible-mode/v1',
      model = 'qwen3-coder-plus',
      timeout = 30000,
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
    auto_suggestions = false,
    auto_set_highlight_group = true,
    auto_set_keymaps = true,
  },
  mappings = {
    diff = {
      ours = 'co',
      theirs = 'ct',
      all_theirs = 'ca',
      both = 'cb',
      cursor = 'cc',
      next = ']x',
      prev = '[x',
    },
    suggestion = {
      accept = '<M-l>',
      next = '<M-]>',
      prev = '<M-[>',
      dismiss = '<C-]>',
    },
    jump = {
      next = ']]',
      prev = '[[',
    },
    submit = {
      normal = '<CR>',
      insert = '<C-s>',
    },
  },
  hints = { enabled = true },
  windows = {
    position = 'right',
    wrap = true,
    width = 40,
    sidebar_header = {
      align = 'center',
      rounded = true,
    },
  },
  highlights = {
    diff = {
      incoming = 'DiffAdd',
      our = 'DiffChange',
    },
  },
  diff = {
    autojump = true,
  },
})
