{
  plugins.codecompanion = {
    enable = true;
    settings = {
      adapters = {
        chutes_ai = {
          __raw = ''
            function()
              return require("codecompanion.adapters").extend("openai_compatible", {
                env = {
                  url="https://llm.chutes.ai",
                  chat_url = "/v1/chat/completions",
                };
                schema = {
                  model = {
                    default = "Qwen/Qwen3-235B-A22B-Instruct-2507",
                  };
                };
              })
            end
          '';
        };
      };
    };
  };
}
