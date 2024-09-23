{ config, pkgs, ... }:
{
  # Enable acme for usage with nginx vhosts
  security.acme = {
    acceptTerms = true;
    defaults = {
      email = "gsalazar@xgs7.com";
      group = "nginx";
      # staging environment
      server = "https://acme-staging-v02.api.letsencrypt.org/directory";
    };
  
    certs = {
      "codefun.fyi" = {
        extraDomainNames = [ "www.codefun.fyi" "blog.codefun.fyi" ];
        dnsProvider = "cloudflare";
        credentialsFile = "/home/deployer/cf/cloudf";
      };
    };
  
  };

}
