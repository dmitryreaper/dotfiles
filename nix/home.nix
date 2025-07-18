{ config, pkgs, ... }:

{
  home.username = "dima";
  home.homeDirectory = "/home/dima";

  home.stateVersion = "25.05"; # Please read the comment before changing.

  #Enable flakes
  nix = {
    package = pkgs.nix;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };

  nixpkgs.config.allowUnfree = true;

  # Import modules
  imports = [
    ./modules/bash.nix
    ./modules/git.nix
    ./modules/packages.nix
    ./modules/emacs.nix
    ./modules/fonts.nix
  ];
  
  home.file = {
  	
  };

  home.sessionVariables = {
    EDITOR = "emacs";
  };

  programs.home-manager.enable = true;
}
