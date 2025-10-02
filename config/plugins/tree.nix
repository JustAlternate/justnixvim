{
  plugins.neo-tree = {
    enable = true;
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>e";
      action = "<cmd>Neotree toggle reveal<cr>";
      options = {
        silent = true;
        desc = "Explorer Neo-tree (root dir)";
      };
    }
  ];
}
