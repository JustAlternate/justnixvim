{
  plugins = {
    lsp-signature.enable = true;
    lsp-lines.enable = true;
    lint.enable = true;
    lsp = {
      enable = true;
      keymaps.lspBuf = {
        "<c-k>" = "signature_help";
        "gi" = "implementation";
      };
      servers = {
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
