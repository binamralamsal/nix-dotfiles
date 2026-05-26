{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gcc
    git
    neovim
  ];

  programs.neovim = {
    enable = true;

    defaultEditor = true;

    viAlias = true;
    vimAlias = true;
  };
}
