{
  plugins = {
    lspsaga = {
      enable = true;
      settings = {
        hover = {
          openCmd = "!librewolf";
          openLink = "gx";
        };
        symbolInWinbar = {
          enable = false; # Breadcrumbs
          showFile = false;
        };

        lightbulb = {
          enable = false;
          sign = false;
        };
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "K";
      action.__raw = ''
        function()
          local winid = require("ufo").peekFoldedLinesUnderCursor()
          if not winid then
            vim.cmd("Lspsaga hover_doc")
          end
        end
      '';
      options = {
        desc = "Hover";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>lo";
      action = "<cmd>Lspsaga outline<CR>";
      options = {
        desc = "Outline";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>lr";
      action = "<cmd>Lspsaga rename<CR>";
      options = {
        desc = "Rename";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>ca";
      action = "<cmd>Lspsaga code_action<CR>";
      options = {
        desc = "Code Action";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>cd";
      action = "<cmd>Lspsaga show_buf_diagnostics<CR>";
      options = {
        desc = "Line Diagnostics";
        silent = true;
      };
    }
    # {
    #   mode = "n";
    #   key = "gl";
    #   action = "<cmd>Lspsaga show_line_diagnostics<CR>";
    #   options = {
    #     desc = "Line Diagnostics";
    #     silent = true;
    #   };
    # }
    # {
    #   mode = "n";
    #   key = "[d";
    #   action = "<cmd>Lspsaga diagnostic_jump_next<CR>";
    #   options = {
    #     desc = "Next Diagnostic";
    #     silent = true;
    #   };
    # }
    # {
    #   mode = "n";
    #   key = "]d";
    #   action = "<cmd>Lspsaga diagnostic_jump_prev<CR>";
    #   options = {
    #     desc = "Previous Diagnostic";
    #     silent = true;
    #   };
    # }
  ];
}
