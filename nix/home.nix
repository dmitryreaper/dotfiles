{ config, pkgs, ... }:

{
  # Базовая информация о пользователе
  home.username = "dima";
  home.homeDirectory = "/home/dima";
  home.stateVersion = "24.11"; # Убедитесь, что версия совпадает с вашей системой

  # Включение Home Manager
  programs.home-manager.enable = true;
  home.enableNixpkgsReleaseCheck = false;

  # Установка пакетов
  home.packages = with pkgs; [
    git
    zip
    unzip
    telegram-desktop
    google-chrome
    libreoffice-qt6-fresh
    wpsoffice
    spotify
    jdk17
    python3
    btop
    vscode
    corefonts
    vistafonts
    obsidian
    veracrypt
    gimp
    geteltorito
    gcc
    gnumake
    gdb
    rxvt-unicode
    p7zip
    wget
    mono
    llvmPackages_15.clang-tools
    python312Packages.pip
    python312Packages.python-lsp-server # Добавляем python-lsp-server

    #virtualization
    virt-manager
    spice-gtk

    #wm
    polybar
    feh
    brightnessctl
    picom-pijulius
    rofi
    sxhkd
    terminus_font
  ];

  # Переменные окружения
  home.sessionVariables = {
    EDITOR = "emacs";
    LANG = "en_US.UTF-8";
  };

  # Управление файлами (пример)
  home.file = {
    ".bashrc".text = ''
      export PATH="$HOME/.local/bin:$PATH"
      xset r rate 300 100
    '';
  };
}
