{
  plugins.codecompanion = {
    enable = true;
    settings = {
      strategies = {
        agent = {
          adapter = "openrouter";
        };
        chat = {
          adapter = "openrouter";
        };
        inline = {
          adapter = "openrouter";
        };
      };
      adapters = {
        openrouter = {
          __raw = ''
            function()
              return require("codecompanion.adapters").extend("openai_compatible", {
                env = {
                  url="https://openrouter.ai/api",
                  chat_url = "/v1/chat/completions",
                  api_key = "OPENROUTER_API_KEY",
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
