{
  plugins.codecompanion = {
    enable = true;
    settings = {
      adapters = {
        openrouter_ai = {
          __raw = ''
            function()
              return require("codecompanion.adapters").extend("openai_compatible", {
                env = {
                  url="https://openrouter.ai/api",
                  chat_url = "/v1/chat/completions",
                };
                schema = {
                  model = {
                    default = "mistralai/devstral-medium",
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
