{
  extraConfigLuaPre = ''
    vim.fn.sign_define("diagnosticsignerror", { text = " ", texthl = "diagnosticerror", linehl = "", numhl = "" })
    vim.fn.sign_define("diagnosticsignwarn", { text = " ", texthl = "diagnosticwarn", linehl = "", numhl = "" })
    vim.fn.sign_define("diagnosticsignhint", { text = "󰌵", texthl = "diagnostichint", linehl = "", numhl = "" })
    vim.fn.sign_define("diagnosticsigninfo", { text = " ", texthl = "diagnosticinfo", linehl = "", numhl = "" })
  '';
  extraConfigLua = ''
    local opt = vim.opt
    local g = vim.g
    local o = vim.o
      -- Neovide
    if g.neovide then
      -- Neovide Fonts
      o.guifont = "Hack Nerd Font Mono:h14:Medium:i"
    end
    -- create (or clear) our cleanup group
    -- local grp = vim.api.nvim_create_augroup("MyLspMapCleanup", { clear = true })

    -- on *every* LSP attach, silently delete the built-ins and then add only our "gr"
    -- vim.api.nvim_create_autocmd("LspAttach", {
    --   group = grp,
    --   callback = function(ev)
    --     local buf = ev.buf
    --
    --     -- modes and keys to nuke
    --     local modes = { "n", "x" }
    --     local keys  = { "gri", "grr", "gra", "grn" }
    --
    --     for _, mode in ipairs(modes) do
    --       for _, lhs in ipairs(keys) do
    --         -- pcall ensures "E31: No such mapping" is caught
    --         pcall(vim.keymap.del, mode, lhs, { buffer = buf })
    --       end
    --     end
    --
    --     -- now bind only your preferred "gr"
    --     vim.keymap.set("n", "gr",
    --       function() require("telescope.builtin").lsp_references() end,
    --       { buffer = buf, desc = "Telescope: LSP references" }
    --     )
    --   end,
    -- })
  '';
}
