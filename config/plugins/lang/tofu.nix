{ pkgs, ... }:
{
  plugins = {
    lsp.servers = {
      tofu_ls.enable = true;
    };
    conform-nvim.settings = {
      formatters_by_ft = {
        terraform = [ "tofu_fmt" ];
        tf = [ "tofu_fmt" ];
        hcl = [ "tofu_fmt" ];
      };
      formatters = {
        tofu_fmt = {
          command = "${pkgs.opentofu}/bin/tofu";
          args = [
            "fmt"
            "-"
          ];
          stdin = true;
        };
      };
    };

    lint = {
      lintersByFt = {
        terraform = [ "tflint" ];
      };

      linters = {
        tflint = {
          cmd = "${pkgs.tflint}/bin/tflint";
        };
      };
    };
  };
}
