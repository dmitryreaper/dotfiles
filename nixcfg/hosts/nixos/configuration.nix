{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./system_modules/kernel/boot.nix
      ./system_modules/services/services.nix
      ./system_modules/audio/pipewire.nix
      #./system_modules/audio/bluetooth.nix
      ./system_modules/users/user.nix
      ./system_modules/security/security.nix
      ./system_modules/packages/systempackage.nix
      #./system_modules/graphics/nvidiadrv/nvidia.nix
      ./system_modules/graphics/x11/xserver.nix
    ];

  networking.hostName = "nixos";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Minsk";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.05"; # Did you read the comment?

}
