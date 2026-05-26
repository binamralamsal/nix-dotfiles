{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # core utilities
    wget curl unzip zip tree

    # search & monitor
    ripgrep fd jq htop btop

    # modern cli
    eza bat fzf zoxide yazi starship

    # dev
    gcc git neovim fnm bun lazygit gh

    # apps
    telegram-desktop anydesk vscode
    foliate qbittorrent appimage-run
  ];

  programs.zsh.enable = true;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  programs.firefox = {
    enable = true;

    profiles.default = {
      extensions.packages =
        with pkgs.nur.repos.rycee.firefox-addons; [
          bitwarden
          ublock-origin
          wappalyzer
          sponsorblock
        ];
    };
  };


  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
}
