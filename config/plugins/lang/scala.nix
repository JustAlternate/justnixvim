{ pkgs, ... }:
{
  extraPackages = with pkgs; [
    scala_2_13
    scalafmt
    coursier
    sbt
    mill
    openjdk17
  ];

  extraPlugins = [
    pkgs.vimPlugins.nvim-metals
  ];

  extraConfigLua = ''
    local metals_config = require("metals").bare_config()

    metals_config.init_options.statusBarProvider = "on"

    metals_config.settings = {
      serverVersion = "latest.snapshot",
    }

    -- Example if you are using cmp how to make sure the correct capabilities for snippets are set
    metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Autocmd that will actually be in charging of starting the whole thing
    local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
    vim.api.nvim_create_autocmd("FileType", {
      -- NOTE: You may or may not want java included here. You will need it if you
      -- want basic Java support but it may also conflict if you are using
      -- something like nvim-jdtls which also works on a java filetype autocmd.
      pattern = { "scala", "sbt" },
      callback = function()
        require("metals").initialize_or_attach(metals_config)
      end,
      group = nvim_metals_group,
    })

  '';

  # extraConfigLua = ''
  #   local metals = require ('metals');
  #   local metals_config = vim.tbl_deep_extend("force", metals.bare_config(), {
  #     on_attach = function(client, bufnr)
  #       if client.server_capabilities.inlayHintProvider then
  #         vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
  #       end
  #       require("which-key").add({
  #         {
  #           "<leader>cm",
  #           function()
  #             require("telescope").extensions.metals.commands()
  #           end,
  #           desc = "Metals commands",
  #           mode = "n"
  #         },
  #         {
  #           "<leader>cc",
  #           function()
  #             require("metals").compile_cascade()
  #           end,
  #           desc = "Metals Compile Cascade",
  #           mode = "n"
  #         },
  #       })
  #     end,
  #     init_options = { statusBarProvider = "off", },
  #     settings = {
  #       showImplicitArguments = true,
  #       metalsBinaryPath = "${pkgs.metals}/bin/metals";
  #     },
  #   })
  #
  #   local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
  #   vim.api.nvim_create_autocmd("FileType", {
  #     pattern = {"scala", "sbt"},
  #     callback = function()
  #       metals.initialize_or_attach(metals_config)
  #     end,
  #     group = nvim_metals_group,
  #   })
  # '';

  plugins = {
    lsp.servers = {
      # metals.enable = true;
    };
  };

}
