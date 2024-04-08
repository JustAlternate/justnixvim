{
  plugins = {
    project-nvim.enableTelescope = true;
    telescope = {
      enable = true;
      extensions = {
        fzf-native.enable = true;
        ui-select = {
          settings = {
            specific_opts = {
              codeactions = true;
            };
          };
        };
        undo = {
          enable = true;
          settings.mappings = {
            i = {
              "<cr>" = "require('telescope-undo.actions').yank_additions";
              "<s-cr>" = "require('telescope-undo.actions').yank_deletions";
              "<c-cr>" = "require('telescope-undo.actions').restore";
            };
            n = {
              "y" = "require('telescope-undo.actions').yank_additions";
              "Y" = "require('telescope-undo.actions').yank_deletions";
              "u" = "require('telescope-undo.actions').restore";
            };
          };
        };
      };
      # Have Telescope not to enter a normal-like mode when hitting escape (and instead exiting), you can map <Esc> to do so via:
      settings.defaults = {
        prompt_prefix = "   ";
        color_devicons = true;
        set_env.COLORTERM = "truecolor";

        mappings = {
          i = {
            "<esc>" = {
              __raw = ''
                function(...)
                  return require("telescope.actions").close(...)
                end'';
            };
          };
        };
      };
      keymaps = {
        "<leader><space>" = {
          action = "find_files, {}";
          options.desc = "Find project files";
        };
        "<leader>ff" = {
          action = "find_files, {}";
          options.desc = "Find project files";
        };
        "<leader>/" = {
          action = "live_grep";
          options.desc = "Grep (root dir)";
        };
        "<leader>:" = {
          action = "command_history, {}";
          options.desc = "Command History";
        };
        "<leader>fr" = {
          action = "oldfiles, {}";
          options.desc = "Recent";
        };
        "<leader>b" = {
          action = "buffers, {}";
          options.desc = "+buffer";
        };
        "<leader>gc" = {
          action = "git_commits, {}";
          options.desc = "commits";
        };
        "<leader>sa" = {
          action = "autocommands, {}";
          options.desc = "Auto Commands";
        };
        "<leader>sC" = {
          action = "commands, {}";
          options.desc = "Commands";
        };
        "<leader>sD" = {
          action = "diagnostics, {}";
          options.desc = "Workspace diagnostics";
        };
        "<leader>sh" = {
          action = "help_tags, {}";
          options.desc = "Help pages";
        };
        "<leader>sH" = {
          action = "highlights, {}";
          options.desc = "Search Highlight Groups";
        };
        "<leader>sk" = {
          action = "keymaps, {}";
          options.desc = "Key maps";
        };
        "<leader>sM" = {
          action = "man_pages, {}";
          options.desc = "Man pages";
        };
        "<leader>sm" = {
          action = "marks, {}";
          options.desc = "Jump to Mark";
        };
        "<leader>so" = {
          action = "vim_options, {}";
          options.desc = "Options";
        };
        "<leader>uC" = {
          action = "colorscheme, {}";
          options.desc = "Colorscheme preview";
        };
      };
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>fp";
      action = "<cmd>Telescope projects<CR>";
      options = {
        desc = "Projects";
      };
    }
    {
      mode = "n";
      key = "<leader>sd";
      action = "<cmd>Telescope diagnostics bufnr=0<cr>";
      options = {
        desc = "Document diagnostics";
      };
    }

    {
      mode = "n";
      key = "<leader>st";
      action = "<cmd>TodoTelescope<cr>";
      options = {
        silent = true;
        desc = "Todo (Telescope)";
      };
    }
  ];
}
