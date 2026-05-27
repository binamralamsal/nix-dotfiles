{ config, pkgs, ... }:
let
  dotfiles = "${config.home.homeDirectory}/dotfiles/config";
  symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    hypr = "hypr";
    # Add more as you create them:
    # waybar = "waybar";
    # wofi = "wofi";
    # nvim = "nvim";
  };
in
{
  home.username = "binamra";
  home.homeDirectory = "/home/binamra";

  imports = [
    ./config/zsh.nix
    ./config/git.nix
    ./config/firefox.nix
    ./config/ghostty.nix
  ];

  xdg.configFile = builtins.mapAttrs (_: subpath: {
    source = symlink "${dotfiles}/${subpath}";
  }) configs;

  home.stateVersion = "25.11";
}
