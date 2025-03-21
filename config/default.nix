{ pkgs, ... }:
{
  imports = [
    ./keymaps.nix
    ./theme.nix
    ./filetype.nix
    ./performance.nix
    ./extraConfig.nix
    ./lazy.nix
    ./autocmd.nix
    ./plugins
  ];

  extraPackages = with pkgs; [
    # Basic
    chafa
    ripgrep
    fzf
    fd
    gnused
    cmake
    stylua

    # git
    lazygit

    # LSP stuff
    nil
    statix # Lints and suggestions for the nix programming language
    deadnix # Find and remove unused code in .nix source files
    nixfmt-rfc-style # Nix Code Formatter

    # llm-ls
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
    providers.wl-copy = {
      enable = true;
      package = pkgs.wl-clipboard;
    };
  };

  opts = {
    number = true;
    relativenumber = true;

    virtualedit = "block";
    cmdheight = 2;
    ignorecase = true;
    smartcase = true;
    updatetime = 50;
    timeoutlen = 250;

    tabstop = 2;
    shiftwidth = 2;
    smartindent = true;

    # Undo stuff from days ago
    swapfile = true;
    undofile = true;

    # Better splitting
    splitbelow = true;
    splitright = true;
  };

  plugins = {
    neoscroll.enable = true;
    dressing.enable = true;
    todo-comments.enable = true;
    web-devicons.enable = true;
    toggleterm.enable = false;
    snacks.enable = true;
    lazygit.enable = true;
    telescope.enable = true;
    bufferline.enable = true;
    fzf-lua.enable = true;
    markdown-preview.enable = true;
    spectre.enable = true;
    spectre.replacePackage = pkgs.gnused;
  };
}
