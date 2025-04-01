{ pkgs, ... }:
{

  extraPackages = with pkgs; [
    typst
    typstyle
    typstfmt
    typst-lsp
    typst-live
  ];

  plugins = {
    conform-nvim.settings = {
      formatters_by_ft.typst = [
        "typstfmt"
      ];
    };

    lsp.servers = {
      typst_lsp.enable = true;
    };
  };
}
