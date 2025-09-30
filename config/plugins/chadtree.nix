{
  plugins.chadtree = {
    enable = true;
    # settings = {
    #   theme = {
    #     icon_glyph_set = "devicons";
    #     text_colour_set = "nerdtree_syntax_dark";
    #   };
    #   view = {
    #     window_options = {
    #       relativenumber = true;
    #     };
    #   };
    # };
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>e";
      action = "<cmd>CHADopen<cr>";
      options = {
        silent = true;
        desc = "Explorer ChadTree (root dir)";
      };
    }
  ];
}
