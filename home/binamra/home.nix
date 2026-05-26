{ config, pkgs, ... }:
let
  dotfiles = "${config.home.homeDirectory}/dotfiles/home/binamra";
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
    ./zsh.nix
    ./git.nix
    ./firefox.nix
    ./ghostty.nix
  ];

  xdg.configFile = builtins.mapAttrs
    (_: subpath: { source = symlink "${dotfiles}/${subpath}"; })
    configs;

  home.stateVersion = "25.11";
}
