{
  imports = [
    ./docker.nix
    ./go.nix
    ./markdown.nix
    ./nix.nix
    # ./php.nix
    # ./python.nix
    # ./scala.nix
    ./terraform.nix
    # ./typst.nix
  ];
  plugins.lsp.servers = {
    protols.enable = true;
  };
}
