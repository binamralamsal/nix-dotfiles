{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix

    ../../modules/system/boot.nix
    ../../modules/system/networking.nix
    ../../modules/system/audio.nix

    ../../modules/desktop/gnome.nix
#    ../../modules/desktop/hyprland.nix

    ../../modules/cli/packages.nix
    ../../modules/cli/dev.nix
  ];

  networking.hostName = "binamra";

  time.timeZone = "Asia/Kathmandu";

  i18n.defaultLocale = "en_US.UTF-8";

  users.users.binamra = {
    isNormalUser = true;
    description = "Binamra Lamsal";

    extraGroups = [
      "wheel"
      "networkmanager"
    ];

    shell = pkgs.zsh;
  };

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  system.stateVersion = "25.11";
}
