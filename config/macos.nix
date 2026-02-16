# macOS-specific optimizations for Nixvim on nix-darwin
# Addresses performance issues with APFS, Jamf Protect, and Ghostty
{ config, lib, pkgs, ... }:
{
  # Only apply on macOS
  config = lib.mkIf pkgs.stdenv.isDarwin {
    # ============================================
    # CLIPBOARD: Use native pbcopy/pbpaste instead of OSC52
    # OSC52 causes input lag in Ghostty on macOS
    # ============================================
    extraConfigLua = ''
      vim.g.clipboard = {
        name = 'macOS-clipboard',
        copy = {
          ['+'] = {'pbcopy'},
          ['*'] = {'pbcopy'},
        },
        paste = {
          ['+'] = {'pbpaste'},
          ['*'] = {'pbpaste'},
        },
        cache_enabled = 1,
      }
    '';

    # ============================================
    # APFS OPTIMIZATIONS: Reduce disk I/O
    # APFS is crash-safe, no need for frequent fsync
    # Using mkForce to override values in default.nix
    # ============================================
    opts = {
      # Disable swap/backup to reduce APFS writes
      swapfile = lib.mkForce false;
      backup = lib.mkForce false;
      writebackup = lib.mkForce false;

      # Faster UI response
      updatetime = lib.mkForce 200;        # Default is 4000ms
      timeoutlen = lib.mkForce 300;        # Faster than default 500ms
      ttimeoutlen = lib.mkForce 10;      # Fast keycode timeout

      # Performance
      synmaxcol = lib.mkForce 240;         # Limit syntax on long lines
      lazyredraw = lib.mkForce true;       # Reduce redraw frequency
      ttyfast = lib.mkForce true;          # Fast terminal output
    };

    # ============================================
    # FILETYPE CACHING: Reduce /nix/store access
    # Prevents reloading filetype plugins on every buffer switch
    # ============================================
    autoGroups = {
      macos_filetype_cache = { };
    };

    autoCmd = [
      # Fast syntax mode for large files only (>500KB)
      # This reduces APFS I/O for huge files while keeping normal syntax for regular files
      {
        group = "macos_filetype_cache";
        event = [ "BufReadPre" ];
        pattern = "*";
        callback = {
          __raw = ''
            function(args)
              local stat = vim.loop.fs_stat(vim.api.nvim_buf_get_name(args.buf))
              if stat and stat.size > 500000 then
                -- Only disable treesitter highlight for very large files
                vim.b[args.buf].large_file = true
              end
            end
          '';
        };
      }
    ];

    # ============================================
    # PLUGIN-SPECIFIC MACOS TUNING
    # ============================================
    plugins = {
      # Gitsigns: Increase debounce for APFS
      gitsigns = {
        settings = {
          update_debounce = lib.mkForce 300;  # Override default 100ms
        };
      };
    };

    # ============================================
    # LSP: Reduce disk logging
    # ============================================
    extraConfigLuaPost = ''
      vim.lsp.set_log_level("ERROR")
    '';
  };
}
