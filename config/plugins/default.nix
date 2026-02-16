{ pkgs, ... }:
{
  imports = [
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
    # ./lspsaga.nix  # Disabled - heavy LSP UI
    ./lualine.nix
    ./luasnip.nix
    ./mini.nix
    # ./minuet.nix  # Disabled - AI completion
    # ./noice.nix  # Disabled - UI overhaul causes lag
    ./notify.nix
    ./tree.nix
    ./treesitter.nix
    # ./treesitter/treesitter-textobjects.nix
    # ./trouble.nix  # Disabled - heavy diagnostics
    # ./ufo.nix  # Disabled - folding can cause lag
    # ./wrapping.nix
    ./whichkey.nix
  ];

  plugins = {
    # neoscroll.enable = true;  # Disabled - smooth scrolling causes lag
    todo-comments.enable = true;
    web-devicons.enable = true;
    lazygit.enable = true;
    # showkeys.enable = true;  # Disabled - runs on every keystroke
    # showkeys.settings = {
    #   maxkeys = 3;
    #   position = "bottom-right";
    #   timeout = 5;
    # };
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
    markdown-preview.enable = true;
    spectre = {
      enable = true;
      package = pkgs.unstable.vimPlugins.nvim-spectre;
    };
  };

}
