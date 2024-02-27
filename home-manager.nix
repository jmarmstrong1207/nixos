{ config, pkgs, ... }:
{
  users.users.critzlez.isNormalUser = true;
  home-manager.users.critzlez = { pkgs, ... }: {
    programs.bash = {
      enable = true;
      shellAliases = {
        ll = "ls -l";
        nixe = "vim ~/.config/nixos";
        nixb = "sudo nixos-rebuild switch";
      };
    };

    # The state version is required and should stay at the version you
    # originally installed.
    home.stateVersion = "23.11";

    home.sessionPath = [
      "$HOME/.config/nixos"
    ];
  };

}
