{ lib, config, ...  }: let
  inherit (config.networking) hostName;
in {
  services = {
    nginx = {
      enable = true;
      recommendedTlsSettings = true;
      recommendedProxySettings = true;
      recommendedGzipSettings = true;
      recommendedOptimisation = true;
      # clientMaxBodySize = "300m";

      virtualHosts = {

        codefun = {
          serverName = "codefun.fyi";
          forceSSL = true;
          enableACME = true;
          root = "/srv/www/codefun.fyi/html";

          locations."/.well-known/acme-challenge" = {
            root = "/var/lib/acme/acme-challenge";
          };
        };

        blog = {
          serverName = "blog.codefun.fyi";
          forceSSL = true;
          useACMEHost = "codefun.fyi";
          root = "/srv/www/codefun.fyi/blog";

          locations."/.well-known/acme-challenge" = {
            root = "/var/lib/acme/acme-challenge";
          };
        };


      }; # end virtualhost
    };
  };
}
