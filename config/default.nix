{ pkgs, ... }:
{
  imports = [
    ./keymaps.nix
    ./theme.nix
    ./filetype.nix
    ./performance.nix
    ./extraConfig.nix
    ./autocmd.nix
    ./plugins
  ];

  extraPackages = with pkgs; [
    # Basic
    chafa
    ripgrep
    fzf
    viu
    ueberzugpp
    fd
    gnused
    cmake
    stylua

    # git
    lazygit

    # LSP stuff
    nil
    statix # Lints and suggestions for the nix programming language
    nixfmt-rfc-style # Nix Code Formatter

    lua-language-server
    stylua
    shfmt
    pyright
    gopls

    # Latex preview
    mupdf

    # Additional nvim plugins
    vimPlugins.plenary-nvim
  ];

  luaLoader.enable = true;

  clipboard = {
    register = "unnamedplus";
  };

  opts = {
    number = true;
    relativenumber = true;

    virtualedit = "block";
    cmdheight = 2;
    ignorecase = true;
    smartcase = true;
    updatetime = 300;
    timeoutlen = 500;
    errorbells = false;

    tabstop = 2;
    shiftwidth = 2;
    smartindent = true;

    ttyfast = true;

    # Undo stuff from days ago
    # swapfile = true;
    # undofile = true;

    # Better splitting
    splitbelow = true;
    splitright = true;
  };
}
