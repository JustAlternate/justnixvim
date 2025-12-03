{ pkgs, ... }:
{
  plugins = {
    lsp.servers = {
      dockerls.enable = true;
      docker_compose_language_service.enable = true;
    };
    conform-nvim.settings = {
      formatters_by_ft = {
        docker = [ "dockerfmt" ];
      };
      formatters = {
        dockerfmt = {
          command = "${pkgs.dockerfmt}/bin/dockerfmt";
        };
      };
    };
  };
}
