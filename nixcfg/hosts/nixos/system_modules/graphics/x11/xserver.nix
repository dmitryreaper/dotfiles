{
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;

    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
    };
    windowManager.xmonad.config = builtins.readFile ./xmonad.hs;
  };
}
