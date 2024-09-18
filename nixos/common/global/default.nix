# This file (and the global directory) holds config that i use on all hosts
{ inputs, outputs, ...  }: {
  imports =
    [
      # Import home-manager's NixOS module
      inputs.home-manager.nixosModules.home-manager
      # ./acme.nix
      # ./auto-upgrade.nix
      ./locale.nix
      ./nix.nix
      ./openssh.nix
      # ./podman.nix
      ./systemd-initrd.nix
      # ./tailscale.nix
    ]

  home-manager = {
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs outputs; };
    useUserPackages = true;
    backupFileExtension = "back";
  };

}
