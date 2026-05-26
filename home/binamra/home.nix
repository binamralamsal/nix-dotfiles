{ config, pkgs, ... }:

{
  home.username = "binamra";
  home.homeDirectory = "/home/binamra";

  imports = [
    ./zsh.nix
    ./git.nix
#    ./hyprland.nix
#    ./ghostty.nix
  ];

  home.stateVersion = "25.11";
}
