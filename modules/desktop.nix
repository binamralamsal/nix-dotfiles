{ pkgs, lib, ... }:

{
  services.xserver.enable = true;

  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    gnome-console
    gnome-connections
    epiphany
    geary
    gnome-maps
    gnome-music
    gnome-weather
    yelp
  ];
}
