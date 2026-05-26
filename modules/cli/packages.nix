{pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wget
    curl
    unzip
    zip
    tree
    ripgrep
    fd
    jq
    htop
    btop
    ghostty

    eza
    bat
    fzf
    zoxide
    yazi
    starship
    fnm
    bun
  ];

  programs.git.enable = true;

  programs.zsh.enable = true;

  programs.firefox.enable = true;

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
}
