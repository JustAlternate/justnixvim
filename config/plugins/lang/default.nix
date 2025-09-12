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
    ./typescript.nix
    # ./typst.nix
  ];
  plugins.lsp.servers = {
    protols.enable = true;
  };
}
