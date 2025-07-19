{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./modules/kernel/boot.nix
      ./modules/services/services.nix
      ./modules/audio/pipewire.nix
      ./modules/audio/bluetooth.nix
      ./modules/users/user.nix
      ./modules/security/security.nix
      ./modules/packages/systempackage.nix
      ./modules/graphics/nvidiadrv/nvidia.nix
      ./modules/graphics/x11/xserver.nix
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
