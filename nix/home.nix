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
    emacs
    git
    telegram-desktop
    google-chrome
    wpsoffice
    unityhub
    spotify
    jdk17
    python3
    btop
    vscode
    corefonts
    vistafonts
    obsidian
    gcc
    rxvt-unicode
    llvmPackages_17.clang-unwrapped
    p7zip
    wget
    dotnet-sdk
  ];

  # Переменные окружения
  home.sessionVariables = {
    EDITOR = "nvim";
    LANG = "en_US.UTF-8";
  };

  # Управление файлами (пример)
  home.file = {
    ".bashrc".text = ''
      export PATH="$HOME/.local/bin:$PATH"
    '';
  };
}
