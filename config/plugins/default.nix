{ pkgs, ... }:
{
  imports = [
    ./99-config.nix
    ./alpha.nix
    ./aw-watcher.nix
    # ./dap.nix
    ./cmp.nix
    ./conform.nix
    ./fidget.nix
    ./flash.nix
    ./gitsigns.nix
    ./lang
    ./lsp.nix
    ./lspkind.nix
    ./lspsaga.nix
    ./lualine.nix
    ./luasnip.nix
    ./mini.nix
    ./minuet.nix
    ./noice.nix
    ./notify.nix
    ./tree.nix
    ./treesitter.nix
    # ./treesitter/treesitter-textobjects.nix
    ./trouble.nix
    ./ufo.nix
    # ./wrapping.nix
    ./whichkey.nix
  ];

  extraPlugins = with pkgs.vimPlugins; [
    (pkgs.callPackage ./99.nix { })
  ];

  plugins = {
    neoscroll.enable = true;
    todo-comments.enable = true;
    web-devicons.enable = true;
    lazygit.enable = true;
    showkeys.enable = true;
    showkeys.settings = {
      maxkeys = 3;
      position = "bottom-right";
      timeout = 5;
    };
    telescope = {
      enable = true;
      settings = {
        defaults = {
          file_ignore_patterns = [
            "mocks/"
            "^.git/"
            "^.mypy_cache/"
            "^__pycache__/"
            "^output/"
            "^data/"
            "%.ipynb"
          ];
        };
      };
    };
    bufferline.enable = true;
    fzf-lua.enable = true;
    markdown-preview.enable = true;
    spectre = {
      enable = true;
      package = pkgs.unstable.vimPlugins.nvim-spectre;
    };
  };

}
