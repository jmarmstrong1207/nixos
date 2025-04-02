{ config, pkgs, pkgs-unstable, inputs, ... }:
let 
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
  nix-alien = inputs.nix-alien.packages.${pkgs.stdenv.system}.nix-alien;
in
{
  imports = [
    inputs.spicetify-nix.nixosModules.spicetify
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  programs.direnv.enable = true;
  programs.nix-ld.enable = true;

  virtualisation.docker = {
    enable = true;
  };

  #Enable VPN
  services.mullvad-vpn.enable = true;
  services.mullvad-vpn.package = pkgs.mullvad-vpn;

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
    transmission_4-gtk
    via
    vscode.fhs

    # Dependencies/misc.
    nixpkgs-fmt # Needed primarily for code formatting in vscode but can also be used in the terminal
    papirus-icon-theme
    bibata-cursors
    xsettingsd
    xorg.xrdb
    
    # For executing non-nixos binaries
    nix-alien
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };
  
  programs.spicetify = {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
      adblockify
      shuffle # shuffle+ (special characters are sanitized out of extension names)
    ];
    theme = spicePkgs.themes.catppuccin;
    colorScheme = "mocha";
  };
}
