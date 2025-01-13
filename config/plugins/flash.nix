{
  plugins.flash = {
    enable = true;
    settings.luaConfig.pre = ''
      {
        "folke/flash.nvim",
        event = "VeryLazy",
        ---@type Flash.Config
        opts = {},
        -- stylua: ignore
      }
    '';
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
