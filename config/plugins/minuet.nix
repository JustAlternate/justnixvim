{ pkgs, ... }:
{
  extraPlugins = [ pkgs.vimPlugins.minuet-ai-nvim ];
  extraConfigLua = ''
      require('minuet').setup {
        -- notify = 'debug',
        provider = 'openai_compatible',
        request_timeout = 2.5,
        throttle = 1500, -- Increase to reduce costs and avoid rate limits
        debounce = 600, -- Increase to reduce costs and avoid rate limits
        n_completions = 1,
        provider_options = {
            openai_compatible = {
                stream = true,
                end_point = 'https://api.groq.com/openai/v1/chat/completions',
                api_key = 'GROQ_API_KEY',
                model = 'qwen-2.5-coder-32b',
                name = 'Groq',
                optional = {
                    max_tokens = 128,
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
