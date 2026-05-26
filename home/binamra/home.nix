{ config, pkgs, ... }:

{
  home.username = "binamra";
  home.homeDirectory = "/home/binamra";

  imports = [
    ./zsh.nix
    ./git.nix
    ./firefox.nix
    ./ghostty.nix
  ];

  home.stateVersion = "25.11";
}
