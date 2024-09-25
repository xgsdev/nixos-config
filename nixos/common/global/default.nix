# This file (and the global directory) holds config that i use on all hosts
{ inputs, outputs, ...  }: {
  imports =
    [
      # Import home-manager's NixOS module
      inputs.home-manager.nixosModules.home-manager
      ./mods/locale.nix
      ./mods/base-cli.nix
      ./mods/nix.nix
      ./mods/openssh.nix
      ./mods/firewall.nix
      ./mods/fail2ban.nix
      ./mods/acme.nix
      ./mods/nginx.nix
      # ./mods/podman.nix
      ./mods/systemd-initrd.nix
      ./mods/auto-upgrade.nix
      # ./mods/tailscale.nix
    ];

  home-manager = {
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs outputs; };
    useUserPackages = true;
    backupFileExtension = "back";
  };

}
