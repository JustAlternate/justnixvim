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
    # (pkgs.vimUtils.buildVimPlugin {
    #   name = "guihua";
    #   src = pkgs.fetchFromGitHub {
    #     owner = "ray-x";
    #     repo = "guihua.lua";
    #     rev = "87bea7b98429405caf2a0ce4d029b027bb017c70";
    #     hash = "sha256-R/ckeCwzWixvL7q2+brvqcvfSK9Mx8pu6zOFgh2lde4=";
    #   };
    # })
  ];
  extraConfigLua = ''
    require('go').setup({
      run_in_floaterm = false
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
      options.desc = "GoTest";
    }
    {
      mode = "n";
      key = "<leader>cgtc";
      action = "<cmd>GoTermClose<cr>";
      options.desc = "GoTest";
    }
    {
      mode = "n";
      key = "<leader>cgf";
      action = "<cmd>GoFmt<cr>";
      options.desc = "GoTest";
    }
  ];

}
