{
  outputs,
  lib,
  config,
  ...
}: {

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
      X11Forwarding = false;
      # Automatically remove stale sockets
      StreamLocalBindUnlink = "yes";
    };

    extraConfig = ''
      AllowAgentForwarding no
      AllowStreamLocalForwarding no
      AcceptEnv LANG LC_*
    '';
  };

  # security.pam = { services.sshd.googleAuthenticator.enable = true; };

}
