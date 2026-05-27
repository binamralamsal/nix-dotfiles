{ pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    # =========================
    # Core / System utilities
    # =========================
    wget
    curl
    unzip
    zip
    tree
    file
    killall

    # =========================
    # Terminal / CLI tools
    # =========================
    starship
    eza
    bat
    fzf
    zoxide
    yazi
    jq
    ripgrep
    fd

    # =========================
    # Monitoring / debugging
    # =========================
    htop
    btop

    # =========================
    # Development
    # =========================
    gcc
    neovim
    lazygit
    python315
    fnm
    bun
    nixfmt
    lua-language-server

    # =========================
    # Hyprland / Wayland
    # =========================
    waybar
    anyrun
    hyprpaper
    walker
    swaynotificationcenter

    # screenshots / clipboard
    grim
    slurp
    swappy
    wl-clipboard
    cliphist

    # =========================
    # GUI Applications
    # =========================
    vscode
    telegram-desktop
    qbittorrent
    foliate
    obs-studio
    anydesk
    appimage-run
  ];

  programs.zsh.enable = true;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
}
