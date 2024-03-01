{ config, pkgs, ... }:
{
  users.users.critzlez.isNormalUser = true;
  home-manager.users.critzlez = { pkgs, ... }: {

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
        custom = "${config.users.users.critzlez.home}/.config/oh-my-zsh";
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
  };
}
