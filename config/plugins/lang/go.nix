{ pkgs, ... }:
{
  extraPackages = with pkgs; [
    mockgen
    iferr
    golines
    delve
    golangci-lint
    richgo
    gomodifytags
    gotestsum
    ginkgo
    gofumpt
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
