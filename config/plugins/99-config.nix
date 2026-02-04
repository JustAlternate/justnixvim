{
  extraConfigLua = ''
    local _99 = require("99")
    local basename = vim.fs.basename(vim.uv.cwd())
    _99.setup({
      model = "opencode/minimax-m2.1-free",
      logger = {
        level = _99.DEBUG,
        path = "/tmp/" .. basename .. ".99.debug",
        print_on_error = true,
      },
      completion = {
        source = "cmp",
        custom_rules = {
          "scratch/custom_rules/",
        },
      },
      md_files = {
        "AGENT.md",
      },
    })

    vim.keymap.set("n", "<leader>9f", function()
      _99.fill_in_function()
    end)
    vim.keymap.set("v", "<leader>9v", function()
      _99.visual_prompt()
    end)
    vim.keymap.set("v", "<leader>9s", function()
      _99.stop_all_requests()
    end)
  '';
}
