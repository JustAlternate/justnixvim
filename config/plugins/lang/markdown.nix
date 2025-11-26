{ pkgs, ... }:
{
  plugins = {
    markdown-preview = {
      enable = true;
    };

    lsp.servers = {
      ltex = {
        enable = true;
        filetypes = [
          "markdown"
          "text"
        ];

        autostart = false;

        settings = {
          completionEnabled = true;
          checkFrequency = "save";
          language = "auto";
        };
      };
    };

    # lint = {
    #   lintersByFt.md = [ "markdownlint-cli2" ];
    #   linters.markdownlint-cli2.cmd = "${pkgs.markdownlint-cli2}/bin/markdownlint-cli2";
    # };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>m";
      action = "<cmd>MarkdownPreview<cr>";
      options = {
        desc = "Markdown preview";
      };
    }
  ];
}
