{pkgs, ...}:

{
  home.packages = with pkgs; [
    nerd-fonts.hack
  ];

  fonts.fontconfig.enable = true;
}
