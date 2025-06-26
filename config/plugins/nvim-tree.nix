{
  plugins.nvim-tree = {
    enable = true;
    autoReloadOnWrite = true;
    disableNetrw = true;
    hijackUnnamedBufferWhenOpening = true;
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>e";
      action = "<cmd>Neotree toggle<cr>";
      options = {
        silent = true;
        desc = "Explorer NeoTree (root dir)";
      };
    }
  ];
}
