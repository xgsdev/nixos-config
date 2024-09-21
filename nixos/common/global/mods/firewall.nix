# { config, pkgs, lib, inputs, ... }:
{ config, ... }:
{
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 80 443 22 ];
    # allowedTCPPortRanges = [
    #   { from = 3000; to = 3004; }
    # ];
  };

}
