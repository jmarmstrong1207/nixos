{ config, pkgs, ... }:
{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  programs.direnv.enable = true;


  virtualisation.docker = {
    enable = true;
    enableNvidia = true;
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # Terminal
    vim
    emacs
    efibootmgr
    distrobox
    zoxide
    git

    # GUI
    vesktop
    spotify
    transmission_4-gtk
    via
    vscode.fhs
    thunderbird

    # Dependencies/misc.
    nixpkgs-fmt # Needed primarily for code formatting in vscode but can also be used in the terminal
    papirus-icon-theme
    bibata-cursors
  ];

  services.jellyfin = {
    enable = true;
    openFirewall = true;
    user = "critzlez";
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };
}
