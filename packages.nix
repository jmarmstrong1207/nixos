{ config, pkgs, ... }:
{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    efibootmgr
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
    emacs
    git
  ];
}
