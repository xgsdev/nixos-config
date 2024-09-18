{inputs, config, ...}: {
  system.autoUpgrade = {
    enable = true;
    # Only enable if not dirty
    # enable = inputs.self ? rev;
    flake = "github:tfc/nixos-configs";
    flags = [ " --no-write-lock-file" ];
    allowReboot = true;
    dates = "02:00";
    rebootWindow = {
      lower = "02:00";
      upper = "05:00";
    };
  };
}
