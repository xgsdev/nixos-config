{ pkgs, config, lib, ...  }:
{
  users.users."www-data" = {
    isNormalUser = true;
    initialPassword = "1234";
    home = "/srv/www/";
    openssh.authorizedKeys.keys = [ ''ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDM0Yxqp+hxegcRn0+WzSqBbPxI58O5Ea7Uu7KeXN9Bo ubuntu@new-2019-sirius'' ];
  };

  system.activationScripts.foo_home_read = pkgs.lib.stringAfter [ "users" ]
  ''
  chmod 755 /srv/www
  '';

}
