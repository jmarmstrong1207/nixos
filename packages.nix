{ config, pkgs, ... }:
{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # Terminal
    vim
    emacs
    efibootmgr

    # GUI
    vesktop
    spotify
    gnome3.gnome-tweaks
    gnomeExtensions.dash-to-dock
    gnomeExtensions.dash-to-panel
    gnomeExtensions.arcmenu
    gnomeExtensions.tiling-assistant
    gnomeExtensions.appindicator
    via
    vscode.fhs
    git

    # Dependencies/misc.

    # Needed primarily for code formatting in vscode but can also be used in the terminal
    nixpkgs-fmt

    papirus-icon-theme
  ];
}
