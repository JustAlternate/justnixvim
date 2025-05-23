{
  globals.mapleader = " ";
  globals.maplocalleader = "\\";

  keymaps = [
    # Windows
    {
      mode = "n";
      key = "<C-k>";
      action = "<C-w>k";
      options.desc = "Move To Window Up";
    }

    {
      mode = "n";
      key = "<C-j>";
      action = "<C-w>j";
      options.desc = "Move To Window Down";
    }

    {
      mode = "n";
      key = "<C-h>";
      action = "<C-w>h";
      options.desc = "Move To Window Left";
    }

    {
      mode = "n";
      key = "<C-l>";
      action = "<C-w>l";
      options.desc = "Move To Window Right";
    }

    {
      mode = "n";
      key = "<C-Up>";
      action = "<cmd>resize +2<cr>";
      options.desc = "Increase Window Height";
    }

    {
      mode = "n";
      key = "<C-Down>";
      action = "<cmd>resize -2<cr>";
      options.desc = "Decrease Window Height";
    }

    {
      mode = "n";
      key = "<C-Left>";
      action = "<cmd>vertical resize -2<cr>";
      options.desc = "Decrease Window Width";
    }

    {
      mode = "n";
      key = "<C-Right>";
      action = "<cmd>vertical resize +2<cr>";
      options.desc = "Increase Window Width";
    }

    {
      mode = "n";
      key = "<leader>wd";
      action = "<C-W>c";
      options = {
        silent = true;
        desc = "Delete window";
      };
    }
    # Buffers
    {
      mode = "n";
      key = "<S-h>";
      action = "<cmd>bprevious<cr>";
      options.desc = "Prev Buffer";
    }

    {
      mode = "n";
      key = "<S-l>";
      action = "<cmd>bnext<cr>";
      options.desc = "Next Buffer";
    }

    {
      mode = "n";
      key = "<leader>bb";
      action = "<cmd>e #<cr>";
      options.desc = "Switch to Other Buffer";
    }

    {
      mode = "n";
      key = "<leader>bd";
      action = ":lua Snacks.bufdelete()<cr>";
      options.desc = "Delete Buffer";
    }

    {
      mode = "n";
      key = "<leader>bo";
      action = ":lua Snacks.bufdelete.other()<cr>";
      options.desc = "Delete Other Buffers";
    }

    # Splitting

    {
      mode = "n";
      key = "<leader>-";
      action = "<C-W>s";
      options = {
        silent = true;
        desc = "Split window below";
      };
    }

    {
      mode = "n";
      key = "<leader>|";
      action = "<C-W>v";
      options = {
        silent = true;
        desc = "Split window right";
      };
    }

    # Quit/Session
    {
      mode = "n";
      key = "<leader>qq";
      action = "<cmd>quitall<cr><esc>";
      options = {
        silent = true;
        desc = "Quit all";
      };
    }

    # Better indenting
    {
      mode = "v";
      key = "<";
      action = "<gv";
    }

    {
      mode = "v";
      key = ">";
      action = ">gv";
    }

    # Redo as U
    {
      mode = "n";
      key = "U";
      action = "<cmd>redo<cr>";
      options.desc = "Redo";
    }

    # Clear search with ESC
    {
      mode = [
        "n"
        "i"
      ];
      key = "<esc>";
      action = "<cmd>noh<cr><esc>";
      options = {
        silent = true;
        desc = "Escape and clear hlsearch";
      };
    }

    # Paste stuff without saving the deleted word into the buffer
    {
      mode = "x";
      key = "p";
      action = "\"_dP";
      options.desc = "Deletes to void register and paste over";
    }

    # Delete to void register
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>D";
      action = "\"_d";
      options.desc = "Delete to void register";
    }

    # Files
    {
      mode = "n";
      key = "<leader>fn";
      action = "<cmd>enew<cr>";
      options.desc = "New File";
    }

    # lazygit
    {
      mode = "n";
      key = "<leader>gg";
      action = ":lua Snacks.lazygit()<cr>";
      options.desc = "Lazygit (cwd)";
    }

    {
      mode = "n";
      key = "<leader>gl";
      action = ":lua Snacks.lazygit.log_file()<cr>";
      options.desc = "Lazygit Current File History";
    }

    # Floating Terminal
    {
      mode = "n";
      key = "<leader>th";
      action = ":lua Snacks.terminal()<cr>";
      options.desc = "Horizontal Terminal (cwd)";
    }
    {
      mode = "n";
      key = "<leader>tv";
      action = ":lua Snacks.terminal.open(nil, { win = { position = 'right' }})<cr>";
      options.desc = "Vertical Terminal (cwd)";
    }

    # Telescope Bindings
    {
      mode = "n";
      key = "<leader>fr";
      action = "<cmd>Telescope oldfiles<cr>";
      options.desc = "Telescope Recent Files";
    }

    {
      mode = "n";
      key = "<leader>fm";
      action = "<cmd>Telescope git_status<cr>";
      options.desc = "Telescope Git Modified Files";
    }

    {
      mode = "n";
      key = "<leader>fg";
      action = "<cmd>Telescope git_files<cr>";
      options.desc = "Telescope Git Files";
    }

    {
      mode = "n";
      key = "<leader>ff";
      action = "<cmd>Telescope find_files<cr>";
      options.desc = "Telescope Files in Current Directory";
    }

    {
      mode = "n";
      key = "<leader>fb";
      action = "<cmd>Telescope buffers<cr>";
      options.desc = "Telescope Buffers";
    }

    {
      mode = "n";
      key = "<leader>sf";
      action = "<cmd>Telescope live_grep<cr>";
      options.desc = "Telescope Search Grep in All Files";
    }

    {
      mode = "n";
      key = "gr";
      action = "<cmd>Telescope lsp_references<cr>";
      options.desc = "Telescope to code references";
    }

    # Refactoring
    {
      mode = "n";
      key = "<leader>crg";
      action = "<cmd>lua require('spectre').toggle()<CR>";
      options.desc = "Spectre replace globaly";
    }
    {
      mode = "n";
      key = "<leader>crf";
      action = "<cmd>lua require('spectre').open_file_search()<CR>";
      options.desc = "Spectre replace in file";
    }

  ];
}
