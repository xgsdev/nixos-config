{
  pkgs,
  config,
  lib,
  ...
}: let
  ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in {
  users.mutableUsers = false;
  users.users.deployer = {
    isNormalUser = true;
    linger = true;
    initialPassword = "1234";
    # shell = pkgs.nushell;
    # packages = [pkgs.home-manager];
    extraGroups = ifTheyExist [
      "audio"
      "deluge"
      "docker"
      "git"
      "libvirtd"
      "mysql"
      "network"
      "plugdev"
      "podman"
      "nginx"
      "wheel"
      "wireshark"
    ];

    openssh.authorizedKeys.keys = [ ''ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDM0Yxqp+hxegcRn0+WzSqBbPxI58O5Ea7Uu7KeXN9Bo ubuntu@new-2019-sirius'' ];

  };

  home-manager.users.deployer = import ../../../../home-manager/deployer/${config.networking.hostName}.nix;

}
