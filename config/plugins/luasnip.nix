{ pkgs, ... }:
{
  plugins.luasnip = {
    enable = true;
    lazyLoad = {
      enable = true;
      settings = {
        event = "InsertEnter";
      };
    };
    settings = {
      enable_autosnippets = true;
      store_selection_keys = "<Tab>";
    };
    fromVscode = [
      {
        lazyLoad = true;
        paths = "${pkgs.vimPlugins.friendly-snippets}";
      }
    ];
  };
}
