{inputs, config, ...}: {

  system.autoUpgrade = {
    enable = true;
    flake = "github:tfc/nixos-configs";
    flags = [ " --no-write-lock-file" ];
    allowReboot = true;
    dates = "Mon *-*-* 03:01:00";
    RandomizedDelaySec = 1800;
    FixedRandomDelay = true;
    rebootWindow = {
      lower = "04:00";
      upper = "05:00";
    };
  };

}
