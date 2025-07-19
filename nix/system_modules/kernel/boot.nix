{
  boot.kernel.sysctl = {
     "net.ipv4.ip_default_ttl" = "65";
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
}
