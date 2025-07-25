{ pkgs, config, ... }:

let
  myEmacsConfig = ./init.el;
in
{
  programs.emacs = {
    enable = true;
    extraConfig = builtins.readFile myEmacsConfig;
    package = pkgs.emacs.pkgs.withPackages (ep: with ep; [
      use-package
      gptel
      gruber-darker-theme
      projectile
      dashboard
      company
      ivy
      ivy-rich
      lsp-mode
      yasnippet
      yasnippet-snippets
      lsp-ui
      counsel
      ivy-prescient
      magit
      forge
      go-mode
      nix-mode
      treemacs
      treemacs-all-the-icons
      haskell-mode
      ace-window
    ]);
  };
}
