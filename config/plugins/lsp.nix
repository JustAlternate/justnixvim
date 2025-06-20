{
  plugins = {
    lsp-signature.enable = true;
    lint.enable = true;
    lsp = {
      enable = true;
      servers = {
        protols = {
          enable = true;
          filetypes = [ "proto" ];
        };
        html = {
          enable = true;
          filetypes = [ "html" ];
        };
        cssls = {
          enable = true;
          filetypes = [
            "css"
            "less"
            "scss"
          ];
        };
        java_language_server = {
          enable = true;
          filetypes = [ "java" ];
        };
        bashls.enable = true;
      };
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>cl";
      action = "<cmd>LspInfo<cr>";
      options.desc = "Lsp Info";
    }
  ];
}
