{ config, pkgs, ... }:
let
  dotfiles = "${config.home.homeDirectory}/dotfiles/config";
  symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    hypr = "hypr";
    waybar = "waybar";
    # Add more as you create them:
    # wofi = "wofi";
    # nvim = "nvim";
  };
in
{
  home.username = "binamra";
  home.homeDirectory = "/home/binamra";
  home.sessionVariables = {
    LD_LIBRARY_PATH = "/run/current-system/sw/share/nix-ld/lib";
  };

  imports = [
    ./config/zsh.nix
    ./config/git.nix
    ./config/firefox.nix
    ./config/ghostty.nix
    ./config/swaylock.nix
    ./config/tmux.nix
  ];

  xdg.configFile = builtins.mapAttrs (_: subpath: {
    source = symlink "${dotfiles}/${subpath}";
  }) configs;


  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;

    package = pkgs.phinger-cursors;
    name = "phinger-cursors-dark";
    size = 24;
  };

  home.stateVersion = "25.11";
}
