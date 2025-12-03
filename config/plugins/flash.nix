{
  plugins.flash = {
    enable = true;
  };

  keymaps = [
    {
      mode = [
        "n"
        "x"
        "o"
      ];
      key = "f";
      action = "<cmd>lua require('flash').jump()<cr>";
      options = {
        desc = "Flash";
      };
    }
  ];
}
