{
  plugins = {
    treesitter = {
      enable = true;
      settings = {
        highlight.enable = true;
        incremental_selection.enable = false;
        indent.enable = true;
      };
      nixvimInjections = true;
    };
    treesitter-context.enable = true;
  };
}
