{ pkgs, ... }:
{
  plugins.copilot-cmp = {
    enable = true;
  };
  plugins.copilot-lua = {
    enable = true;
    settings = {
      suggestion = {
        enabled = false;
      };
      panel = {
        enabled = false;
      };
    };
  };

  extraPlugins = [
    pkgs.vimPlugins.minuet-ai-nvim
  ];

  extraConfigLua = ''
    require("copilot").setup({
      suggestion = { enabled = true },
      panel = { enabled = false },
    })


    require('minuet').setup({
      -- Enable or disable auto-completion. Note that you still need to add
      -- Minuet to your cmp/blink sources. This option controls whether cmp/blink
      -- will attempt to invoke minuet when minuet is included in cmp/blink
      -- sources. This setting has no effect on manual completion; Minuet will
      -- always be enabled when invoked manually. You can use the command
      -- `Minuet cmp/blink toggle` to toggle this option.
      cmp = {
          enable_auto_complete = false,
      },
      blink = {
          enable_auto_complete = false,
      },
      virtualtext = {
          auto_trigger_ft = {},
          auto_trigger_ignore_ft = {},
          keymap = {
              -- accept whole completion
              accept = '<Tab>',
          },
          show_on_completion_menu = true,
      },
      provider = 'openai_compatible',
      -- the maximum total characters of the context before and after the cursor
      -- 16000 characters typically equate to approximately 4,000 tokens for
      -- LLMs.
      context_window = 16000,
      -- when the total characters exceed the context window, the ratio of
      -- context before cursor and after cursor, the larger the ratio the more
      -- context before cursor will be used. This option should be between 0 and
      -- 1, context_ratio = 0.75 means the ratio will be 3:1.
      context_ratio = 0.75,
      throttle = 1000, -- only send the request every x milliseconds, use 0 to disable throttle.
      debounce = 200, -- debounce the request in x milliseconds, set to 0 to disable debounce
      -- The request timeout, measured in seconds. When streaming is enabled
      -- (stream = true), setting a shorter request_timeout allows for faster
      -- retrieval of completion items, albeit potentially incomplete.
      -- Conversely, with streaming disabled (stream = false), a timeout
      -- occurring before the LLM returns results will yield no completion items.
      request_timeout = 3,
      -- The number of completion items encoded as part of the prompt for the
      -- chat LLM. For FIM model, this is the number of requests to send. It's
      -- important to note that when 'add_single_line_entry' is set to true, the
      -- actual number of returned items may exceed this value. Additionally, the
      -- LLM cannot guarantee the exact number of completion items specified, as
      -- this parameter serves only as a prompt guideline.
      n_completions = 1,
      -- Defines the length of non-whitespace context after the cursor used to
      -- filter completion text. Set to 0 to disable filtering.
      --
      -- Example: With after_cursor_filter_length = 3 and context:
      --
      -- "def fib(n):\n|\n\nfib(5)" (where | represents cursor position),
      --
      -- if the completion text contains "fib", then "fib" and subsequent text
      -- will be removed. This setting filters repeated text generated by the
      -- LLM. A large value (e.g., 15) is recommended to avoid false positives.
      after_cursor_filter_length = 15,
      provider_options = {
          openai_compatible = {
              api_key = 'DEEPINFRA_API_KEY', -- SET YOUR DEEPINFRA_API_KEY environment variable !!!!
              end_point = 'https://api.deepinfra.com/v1/openai/chat/completions',
              model = 'Qwen/Qwen2.5-Coder-32B-Instruct',
              name = 'DEEPINFRA',
              optional = {
                  max_tokens = 512,
                  top_p = 0.9,
              },
          },
      },
    })
  '';
}
