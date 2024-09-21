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
          root = "/var/www/codefun.fyi/html";

          locations."/.well-known/acme-challenge" = {
            root = "/var/lib/acme/acme-challenge";
          };
        };

        "www.codefun.fyi" = {
          serverName = "www.codefun.fyi";
          forceSSL = true;
          useACMEHost = "codefun.fyi";

          locations = {
            "/.well-known/acme-challenge" = {
              root = "/var/lib/acme/acme-challenge";
            };

            "/" = {
              return = "301 https://codefun.fyi$request_uri";
            };
          };
        };

        blog = {
          serverName = "blog.codefun.fyi";
          forceSSL = true;
          useACMEHost = "codefun.fyi";
          root = "/var/www/codefun.fyi/blog";

          locations."/.well-known/acme-challenge" = {
            root = "/var/lib/acme/acme-challenge";
          };
        };


      }; # end virtualhost
    };
  };
}
