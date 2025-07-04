{
  colorschemes.catppuccin = {
    enable = false;
    settings = {
      background = {
        light = "macchiato";
        dark = "mocha";
      };
      flavour = "macchiato"; # “latte”, “mocha”, “frappe”, “macchiato”, “auto”
      transparent_background = true;
      integrations = {
        cmp = true;
        flash = true;
        fidget = true;
        gitsigns = true;
        mini.enabled = true;
        nvimtree = true;
        noice = true;
        notify = true;
        telescope.enabled = true;
        treesitter = true;
        treesitter_context = true;
        which_key = true;
        native_lsp = {
          enabled = true;
          inlay_hints = {
            background = true;
          };
          virtual_text = {
            errors = [ "italic" ];
            hints = [ "italic" ];
            information = [ "italic" ];
            warnings = [ "italic" ];
            ok = [ "italic" ];
          };
          underlines = {
            errors = [ "underline" ];
            hints = [ "underline" ];
            information = [ "underline" ];
            warnings = [ "underline" ];
          };
        };
      };
    };
  };
}
