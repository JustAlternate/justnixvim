{ pkgs, ... }:
{
  extraPlugins = with pkgs.vimPlugins; [
    go-nvim
    (pkgs.vimUtils.buildVimPlugin {
      name = "guihua";
      src = pkgs.fetchFromGitHub {
        owner = "ray-x";
        repo = "guihua.lua";
        rev = "d783191eaa75215beae0c80319fcce5e6b3beeda";
        hash = "sha256-XpUsbj1boDfbyE8C6SdOvZdkd97682VVC81fvQ5WA/4=";
      };
    })
  ];
  extraConfigLua = ''
    require('go').setup({
      run_in_floaterm = true
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
