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

        "_" = {
          serverName = "_";
          default = true;
          forceSSL = true;
          useACMEHost = "codefun.fyi";
          root = "/srv/www/codefun.fyi/default";

          locations."/.well-known/acme-challenge" = {
            root = "/var/lib/acme/acme-challenge";
          };
        };

##########################################
        "codefun.fyi" = {
          serverName = "codefun.fyi";
          forceSSL = true;
          enableACME = true;
          root = "/srv/www/codefun.fyi/html";
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

      "blog.codefun.fyi" = {
        serverName = "blog.codefun.fyi";
        forceSSL = true;
        useACMEHost = "codefun.fyi";
        root = "/srv/www/codefun.fyi/blog";
        locations."/.well-known/acme-challenge" = {
          root = "/var/lib/acme/acme-challenge";
        };
      };

      "codebrick.top" = {
        serverName = "codebrick.top";
        forceSSL = true;
        enableACME = true;
        root = "/srv/www/codebrick.top/html";
        locations."/.well-known/acme-challenge" = {
          root = "/var/lib/acme/acme-challenge";
        };
      };

      "www.codebrick.top" = {
        serverName = "www.codebrick.top";
        forceSSL = true;
        useACMEHost = "codebrick.top";
        locations = {
          "/.well-known/acme-challenge" = {
            root = "/var/lib/acme/acme-challenge";
          };
          "/" = {
            return = "301 https://codebrick.top$request_uri";
          };
        };
      };

      "sandbox-xie7h.codebrick.top" = {
        serverName = "sandbox-xie7h.codebrick.top";
        forceSSL = true;
        useACMEHost = "codebrick.top";
        root = "/srv/www/codebrick.top/sandbox-xie7h";
        locations."/.well-known/acme-challenge" = {
          root = "/var/lib/acme/acme-challenge";
        };
      };

##########################################


      }; # end virtualhost
    };
  };
}
