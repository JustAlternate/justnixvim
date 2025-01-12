{
  plugins = {
    treesitter = {
      enable = true;
      settings = {
        highlight.enable = true;
        incremental_selection.enable = true;
        indent.enable = true;
        ensure_installed = "all";
      };
      nixvimInjections = true;
    };
    treesitter-context.enable = true;
  };
}
