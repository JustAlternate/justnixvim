{ pkgs, ... }:
{
  extraPlugins = [ pkgs.vimPlugins.minuet-ai-nvim ];
  extraConfigLua = ''
    local is_mac = vim.loop.os_uname().sysname == "Darwin"

    local accept_key = is_mac and "<D-a>" or "<C-A>"
    local accept_line_key = is_mac and "<D-A>" or "<C-S-a>"
    local accept_n_lines_key = is_mac and "<A-z>" or "<M-z>"
    local prev_key = is_mac and "<D-e>" or "<C-e>"
    local next_key = is_mac and "<D-z>" or "<C-z>"
    local dismiss_key = is_mac and "<D-r>" or "<C-r>"

    require('minuet').setup {
        provider = 'openai_compatible',
        context_window = 3000,
        context_ratio = 0.75,
        request_timeout = 2,
        throttle = 500,
        debounce = 250,
        n_completions = 3,
        provider_options = {
            openai_compatible = {
                stream = true,
                end_point = 'https://openrouter.ai/api/v1/chat/completions',
                api_key = 'OPENROUTER_API_KEY',
                model = 'mistralai/codestral-2508',
                optional = {
                    max_tokens = 1200,
                    top_p = 0.9,
                },
            },
        },
        cmp = { enable_auto_complete = false },
        blink = { enable_auto_complete = false },
        lsp = {
            enabled_ft = {},
            enabled_auto_trigger_ft = {},
            warn_on_blink_or_cmp = false,
        },
        virtualtext = {
            auto_trigger_ft = {},
            show_on_completion_menu = true,
            keymap = {
                accept = accept_key,
                accept_line = accept_line_key,
                accept_n_lines = accept_n_lines_key,
                prev = prev_key,
                next = next_key,
                dismiss = dismiss_key,
            },
        },
    }
  '';
}
