{ pkgs, ... }:
{
  extraPackages = with pkgs; [
    mockgen
    iferr
    golines
    delve
    golangci-lint
    richgo
    gomodifytags
    gotestsum
    ginkgo
    gofumpt
    gotools
    govulncheck
    impl
    reftools
    gotests
  ];

  plugins = {
    lsp.servers = {
      gopls.enable = true;
    };
    conform-nvim.settings = {
      formatters_by_ft = {
        go = [ "gofmt" ];
      };
      formatters = {
        gofmt = {
          command = "${pkgs.go}/bin/gofmt";
        };
      };
    };
  };
  extraPlugins = with pkgs.vimPlugins; [
    go-nvim
    (pkgs.vimUtils.buildVimPlugin {
      name = "guihua";
      src = pkgs.fetchFromGitHub {
        owner = "ray-x";
        repo = "guihua.lua";
        rev = "87bea7b98429405caf2a0ce4d029b027bb017c70";
        hash = "sha256-R/ckeCwzWixvL7q2+brvqcvfSK9Mx8pu6zOFgh2lde4=";
      };
      buildPhase = ''
        (
          cd lua/fzy
          make
        )
      '';
      nvimSkipModules = [ "fzy.fzy-lua-native" ];
    })
  ];

  extraConfigLua = ''
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "go", "gomod" },
      callback = function()
        require('go').setup({
          run_in_floaterm = true
        })
      end,
    })
  '';

  keymaps = [
    {
      mode = "n";
      key = "<leader>cgt";
      action = "<cmd>GoTest<cr>";
      options.desc = "GoTest";
    }
    {
      mode = "n";
      key = "<leader>cgtf";
      action = "<cmd>GoTestFile<cr>";
      options.desc = "GoTestFile";
    }
    {
      mode = "n";
      key = "<leader>cgtt";
      action = "<cmd>GoTest<cr>";
      options.desc = "GoTest";
    }
    {
      mode = "n";
      key = "<leader>cgtc";
      action = "<cmd>GoTermClose<cr>";
      options.desc = "GoTermClose";
    }
    {
      mode = "n";
      key = "<leader>cgf";
      action = "<cmd>GoFmt<cr>";
      options.desc = "GoFmt";
    }
  ];

}
