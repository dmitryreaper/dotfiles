{ pkgs, ... }:

{
  home.packages = [
    #applications
    pkgs.chromium
    pkgs.alacritty
    pkgs.telegram-desktop
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
    pkgs.clang-tools
  ];
}
