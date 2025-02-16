{
  plugins.lualine = {
    enable = true;
    settings = {
      sections = {
        lualine_x = [
          {
            "__unkeyed.1".__raw = "require('noice').api.statusline.mode.get";
            cond.__raw = "require('noice').api.statusline.mode.has";
            color = {
              fg = "#ff9e64";
            };
          }
        ];
      };
    };
  };
}
