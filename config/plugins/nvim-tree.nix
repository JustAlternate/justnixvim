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
      action = "<cmd>NvimTreeToggle<cr>";
      options = {
        silent = true;
        desc = "Explorer NvimTree (root dir)";
      };
    }
  ];
}
