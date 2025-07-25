{ pkgs, ... }:

{
  home.packages = [
    #applications
    pkgs.chromium
    pkgs.alacritty
    pkgs.telegram-desktop
    pkgs.obs-studio
    pkgs.spotify
    pkgs.obsidian

    #progs lang
    pkgs.go
    pkgs.gopls

    #develop
    pkgs.qtcreator
    #pkgs.qt6.full
    pkgs.libsForQt5.full
    pkgs.gnumake
    pkgs.cmake
    pkgs.unzip
    #pkgs.gcc
    pkgs.clang
    pkgs.gdb
    pkgs.ripgrep
    pkgs.clang-tools

    #system tools
    pkgs.killall

    #gnome
    pkgs.gnome-tweaks
    pkgs.gnome-shell
    pkgs.gnome-themes-extra

    #xmonad
    pkgs.wget
    pkgs.curl
    pkgs.picom
    pkgs.polybar
    pkgs.flameshot
    pkgs.feh
    pkgs.pulseaudio
    pkgs.polybar-pulseaudio-control
    pkgs.rofi
  ];
}
