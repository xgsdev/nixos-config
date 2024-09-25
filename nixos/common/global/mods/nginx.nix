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

      appendHttpConfig = ''
        map $http_x_forwarded_for $real_client_ip {
          ~^(\d+\.\d+\.\d+\.\d+) $1;
          default $http_cf_connecting_ip;
        }

        log_format custom_log_format '$real_client_ip - $remote_user [$time_local] '
                             '"$request" $status $body_bytes_sent '
                             '"$http_host" "$upstream_response_time"'
                             '"$http_referer" "$http_user_agent"';
      '';

      virtualHosts = {

        # "_" = {
        #   serverName = "_";
        #   default = true;
        #   forceSSL = true;
        #   useACMEHost = "codefun.fyi";
        #   root = "/srv/www/codefun.fyi/default";

        #   locations."/.well-known/acme-challenge" = {
        #     root = "/var/lib/acme/acme-challenge";
        #   };
        # };

##########################################
        "codefun.fyi" = {
          serverName = "codefun.fyi";
          forceSSL = true;
          enableACME = true;
          root = "/srv/www/codefun.fyi/html";
          locations."/.well-known/acme-challenge" = {
            root = "/var/lib/acme/acme-challenge";
          };
          extraConfig = ''
          charset utf-8;
          include  /var/log/nginx/allow-cloudflare-only.conf;
          access_log /var/log/nginx/access.log custom_log_format;
          '';
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
        extraConfig = ''
          charset utf-8;
          include  /var/log/nginx/allow-cloudflare-only.conf;
          access_log /var/log/nginx/access.log custom_log_format;
          '';
      };

      "codebrick.top" = {
        serverName = "codebrick.top";
        forceSSL = true;
        enableACME = true;
        root = "/srv/www/codebrick.top/html";
        locations."/.well-known/acme-challenge" = {
          root = "/var/lib/acme/acme-challenge";
        };
        extraConfig = ''
          charset utf-8;
          include  /var/log/nginx/allow-cloudflare-only.conf;
          access_log /var/log/nginx/access.log custom_log_format;
          '';
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
        extraConfig = ''
          charset utf-8;
          include /var/log/nginx/allow-cloudflare-only.conf;
          access_log /var/log/nginx/access.log custom_log_format;
          '';
      };

##########################################


      }; # end virtualhost
    };
  };
}
