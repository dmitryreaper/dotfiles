{
  programs.bash = {
    enable = true;
    shellAliases = {
      hr = "home-manager switch";
      hg = "home-manager generations";

      sr = "sudo nixos-rebuild switch";
      sg = "nixos-rebuild list-generations";

      em = "emacs -nw";
    };
    
    bashrcExtra = ''
      xset r rate 300 100
    '';
  };
}

