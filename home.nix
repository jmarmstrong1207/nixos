{ config, pkgs, ... }:
{
  programs.home-manager.enable = true;
  home.username = "critzlez";
  home.homeDirectory = "/home/critzlez";

  programs.thefuck = {
    enable = true;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -l";
      nixe = "vim ~/.config/nixos";
      nixb = "sudo nixos-rebuild switch";
    };

    oh-my-zsh = {
      enable = true;
      custom = "/home/critzlez/.config/oh-my-zsh";
      plugins = [ "git" "thefuck" ];
      theme = "agnoster";
    };
  };

  # The state version is required and should stay at the version you
  # originally installed.
  home.stateVersion = "23.11";



  home.sessionPath = [
    "$HOME/.config/nixos"
  ];

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };
}
