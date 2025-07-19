{
  programs.bash = {
    enable = true;
    shellAliases = {
      hr = "home-manager switch";
      hg = "home-manager generations";
    };
    
    bashrcExtra = ''
      xset r rate 300 100
    '';
  };
}

