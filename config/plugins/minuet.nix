{ pkgs, ... }:
{
  extraPlugins = [ pkgs.vimPlugins.minuet-ai-nvim ];
  extraConfigLua = ''
      require('minuet').setup {
        -- notify = 'debug',
        provider = 'openai_compatible',
        context_window = 8000,
        -- when the total characters exceed the context window, the ratio of
        -- context before cursor and after cursor, the larger the ratio the more
        -- context before cursor will be used. This option should be between 0 and
        -- 1, context_ratio = 0.75 means the ratio will be 3:1.
        context_ratio = 0.75,
        request_timeout = 5,
        throttle = 1000, -- Increase to reduce costs and avoid rate limits
        debounce = 300, -- Increase to reduce costs and avoid rate limits
        n_completions = 1,
        provider_options = {
            openai_compatible = {
                stream = false,
                end_point = 'https://api.deepinfra.com/v1/openai/chat/completions',
                api_key = 'DEEPINFRA_API_KEY',
                model = 'Qwen/Qwen2.5-Coder-32B-Instruct',
                optional = {
                    max_tokens = 2048,
                    top_p = 0.9,
                },
            },
        },
        cmp = {
            enable_auto_complete = true,
        },
        blink = {
            enable_auto_complete = false,
        },
        virtualtext = {
            auto_trigger_ft = { "*" },
            show_on_completion_menu = true,
            keymap = {
                -- accept whole completion
                accept = '<A-A>',
                -- accept one line
                accept_line = '<A-a>',
                -- accept n lines (prompts for number)
                -- e.g. "A-z 2 CR" will accept 2 lines
                accept_n_lines = '<A-z>',
                -- Cycle to prev completion item, or manually invoke completion
                prev = '<A-[>',
                -- Cycle to next completion item, or manually invoke completion
                next = '<A-]>',
                dismiss = '<A-e>',
            },
        },
    }
  '';
}
