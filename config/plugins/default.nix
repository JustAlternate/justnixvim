{
  imports = [
    ./alpha.nix
    # ./dap.nix
    ./aw-watcher.nix
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

  plugins = {
    neoscroll.enable = true;
    todo-comments.enable = true;
    web-devicons.enable = true;
    lazygit.enable = true;
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
    spectre.enable = true;
  };

}
