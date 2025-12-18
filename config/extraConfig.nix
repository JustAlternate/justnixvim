# extraConfig.nix
{
  extraConfigLuaPre = ''
    vim.fn.sign_define("diagnosticsignerror", { text = " ", texthl = "diagnosticerror", linehl = "", numhl = "" })
    vim.fn.sign_define("diagnosticsignwarn",  { text = " ", texthl = "diagnosticwarn",  linehl = "", numhl = "" })
    vim.fn.sign_define("diagnosticsignhint",  { text = "󰌵", texthl = "diagnostichint", linehl = "", numhl = "" })
    vim.fn.sign_define("diagnosticsigninfo",  { text = " ", texthl = "diagnosticinfo", linehl = "", numhl = "" })
  '';

  extraConfigLua = ''
    vim.g.clipboard = 'osc52'

    vim.deprecate = function() end  -- Silently ignore deprecation warnings

    local function clear_gr_mappings(buf)
      local modes = { "n", "x" }
      local keys  = { "gri", "grr", "gra", "grn" }

      for _, lhs in ipairs(keys) do
        for _, mode in ipairs(modes) do
          -- try buffer-local removal first, then global
          pcall(vim.keymap.del, mode, lhs, { buffer = buf })
          pcall(vim.keymap.del, mode, lhs)
        end
      end
    end

    local function setup_gr_to_telescope(buf)
      -- set only 'gr' in normal mode, buffer-local
      vim.keymap.set("n", "gr",
        function() require("telescope.builtin").lsp_references() end,
        { buffer = buf, desc = "Telescope: LSP references", noremap = true, silent = true }
      )
    end

    local grp = vim.api.nvim_create_augroup("MyLspMapCleanup", { clear = true })

    vim.api.nvim_create_autocmd("LspAttach", {
      group = grp,
      callback = function(ev)
        local buf = ev.buf
        clear_gr_mappings(buf)
        vim.defer_fn(function()
          clear_gr_mappings(buf)
          setup_gr_to_telescope(buf)
        end, 100)
        -- initial setup as well
        setup_gr_to_telescope(buf)
      end,
    })

    vim.api.nvim_create_autocmd("BufEnter", {
      group = grp,
      callback = function(ev)
        clear_gr_mappings(ev.buf)
      end,
    })
  '';
}
