{ pkgs, ... }:
{
  extraPackages = with pkgs; [
    gotools
    govulncheck
    impl
    reftools
    gotests
  ];

  plugins = {
    lsp.servers = {
      gopls.enable = true;
    };
  };
}
