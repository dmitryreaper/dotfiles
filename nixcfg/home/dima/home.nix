{ config, pkgs, ... }:

{
  home.username = "dima";
  home.homeDirectory = "/home/dima";

  home.stateVersion = "25.05"; # Please read the comment before changing.

  nixpkgs.config.allowUnfree = true;

  # Import modules
  imports = [
    ./home_modules/bash.nix
    ./home_modules/git.nix
    ./home_modules/packages.nix
    ./home_modules/emacs.nix
    ./home_modules/fonts.nix
  ];

  home.file = {

  };

  home.sessionVariables = {
    EDITOR = "emacs";
  };

  programs.home-manager.enable = true;
}
