{ config, pkgs, lib, ... }:

{
  home.username = "binamra";
  home.homeDirectory = "/home/binamra";

  imports = [
    ./zsh.nix
    ./git.nix
    ./firefox.nix
    ./ghostty.nix
  ];

  home.activation.installNode =
    lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      ${pkgs.fnm}/bin/fnm install latest
      ${pkgs.fnm}/bin/fnm default latest
    '';

  home.stateVersion = "25.11";
}
