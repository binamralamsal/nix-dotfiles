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
    nwg-look
    pamixer
    brightnessctl
    libnotify
    networkmanagerapplet

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
    hyprpaper
    swaynotificationcenter
    swayosd
    vicinae
    wlogout
    hyprcursor
    hyprpicker

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
    inputs.helium-flake.packages.${pkgs.system}.helium
  ];

  programs.zsh.enable = true;
  programs.nm-applet.enable = true;
  services.cloudflare-warp.enable = true;

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
