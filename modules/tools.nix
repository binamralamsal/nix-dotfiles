{ pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    # core utilities
    wget curl unzip zip tree killall

    # search & monitor
    ripgrep fd jq htop btop

    # modern cli
    eza bat fzf zoxide yazi starship

    # dev
    gcc neovim fnm bun lazygit python315

    # apps
    telegram-desktop anydesk vscode
    foliate qbittorrent appimage-run
    waybar anyrun hyprpaper hyprlauncher
    slurp swappy grim wl-clipboard cliphist
    swaynotificationcenter hyprpaper obs-studio
    file
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
