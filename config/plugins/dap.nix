{ pkgs, ... }:
{
  extraPlugins = with pkgs.vimPlugins; [
    telescope-dap-nvim
  ];

  plugins = {
    dap-go = {
      enable = true;
      settings = {
        delve.path = "${pkgs.delve}/bin/dlv";
      };
    };
    dap-ui = {
      enable = true;
    };
    dap-virtual-text = {
      enable = true;
    };
    dap = {
      enable = true;

      signs = {
        dapBreakpoint = {
          text = "●";
          texthl = "DapBreakpoint";
        };
      };
      adapters = { };
    };
  };

  keymaps = [
    # DAP
    {
      mode = "n";
      key = "<leader>db";
      action = ''<CMD>lua require("dap").toggle_breakpoint()<CR>'';
      options = {
        desc = "Toggle Breakpoint";
      };
    }
    {
      mode = "n";
      key = "<leader>do";
      action = ''<CMD>lua require("dap").step_over()<CR>'';
      options = {
        desc = "Step Over";
      };
    }
    {
      mode = "n";
      key = "<leader>di";
      action = ''<CMD>lua require("dap").step_into()<CR>'';
      options = {
        desc = "Step Into";
      };
    }
    {
      mode = "n";
      key = "<leader>dc";
      action = ''<CMD>lua require("dap").continue()<CR>'';
      options = {
        desc = "Continue";
      };
    }
    {
      mode = "n";
      key = "<leader>du";
      action = ''<cmd>lua require("dapui").toggle()<cr>'';
      options = {
        desc = "Toggle DAPUI";
      };
    }
  ];
}
