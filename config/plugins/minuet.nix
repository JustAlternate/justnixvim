{ pkgs, ... }:
{
  extraPlugins = [ pkgs.vimPlugins.minuet-ai-nvim ];
  extraConfigLua = ''
      require('minuet').setup {
        -- notify = 'debug',
        provider = 'openai_compatible',
        context_window = 1000,
        -- when the total characters exceed the context window, the ratio of
        -- context before cursor and after cursor, the larger the ratio the more
        -- context before cursor will be used. This option should be between 0 and
        -- 1, context_ratio = 0.75 means the ratio will be 3:1.
        context_ratio = 0.75,
        request_timeout = 3,
        throttle = 750, -- Increase to reduce costs and avoid rate limits
        debounce = 500, -- Increase to reduce costs and avoid rate limits
        n_completions = 3,
        provider_options = {
            openai_compatible = {
                stream = true,
                end_point = 'https://openrouter.ai/api/v1/chat/completions',
                api_key = 'OPENROUTER_API_KEY',
                model = 'mistralai/codestral-2508',
                optional = {
                    max_tokens = 2500,
                    top_p = 0.9,
                },
            },
        },
        cmp = {
            enable_auto_complete = false,
        },
        blink = {
            enable_auto_complete = false,
        },
        lsp   = {
          enabled_ft = {},                 -- don't attach as LSP unless you want to
          enabled_auto_trigger_ft = {},    -- definitely no auto-trigger
          warn_on_blink_or_cmp = false,    -- optional: silence the hint
        },
        virtualtext = {
            auto_trigger_ft = {},
            show_on_completion_menu = false,
          
            keymap = {
                -- accept whole completion
                accept = '<D-a>',
                -- accept one line
                accept_line = '<D-A>',
                -- accept n lines (prompts for number)
                -- e.g. "A-z 2 CR" will accept 2 lines
                accept_n_lines = '<A-z>',
                -- Cycle to prev completion item, or manually invoke completion
                prev = '<D-e>',
                -- Cycle to next completion item, or manually invoke completion
                next = '<D-z>',
                dismiss = '<D-r>',
            },
        },
    }
  '';
}
