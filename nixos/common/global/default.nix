# This file (and the global directory) holds config that i use on all hosts
{ inputs, outputs, ...  }: {
  imports =
    [
      # Import home-manager's NixOS module
      inputs.home-manager.nixosModules.home-manager
      # ./acme.nix
      # ./auto-upgrade.nix
      ./mods/locale.nix
      ./mods/base-cli.nix
      ./mods/nix.nix
      ./mods/openssh.nix
      # ./mods/podman.nix
      ./mods/systemd-initrd.nix
      # ./mods/tailscale.nix
    ];

  home-manager = {
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs outputs; };
    useUserPackages = true;
    backupFileExtension = "back";
  };

}
