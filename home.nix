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
    plugins = [
      {
        name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "chisui";
          repo = "zsh-nix-shell";
          rev = "v0.8.0";
          sha256 = "1lzrn0n4fxfcgg65v0qhnj7wnybybqzs4adz7xsrkgmcsr0ii8b7";
        };
      }
    ];

    shellAliases = {
      ll = "ls -l";
      nixe = "vim ~/.config/nixos";
      nixb = "sudo nixos-rebuild switch";
      nixu = "(cd ~/.config/nixos && sudo nix flake update && sudo nixos-rebuild switch)";
    };

    oh-my-zsh = {
      enable = true;
      custom = "/home/critzlez/.config/oh-my-zsh";
      plugins = [ "git" "thefuck" "zoxide"];
      theme = "agnoster";
    };
  };

  # The state version is required and should stay at the version you
  # originally installed.
  home.stateVersion = "23.11";

  home.sessionPath = [
    "$HOME/.config/nixos"
  ];
}
