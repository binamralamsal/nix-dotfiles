{ pkgs, ... }:

{
  programs.kitty.enable = true;

  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      "$mod" = "SUPER";

      monitor = ",preferred,auto,1";

      exec-once = [
        "waybar"
        "dunst"
      ];

      bind = [
        "$mod, RETURN, exec, ghostty"
        "$mod, D, exec, rofi -show drun"
        "$mod, Q, killactive"
        "$mod, F, fullscreen"

        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"
      ];

      input = {
        kb_layout = "us";
      };

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
      };

      decoration = {
        rounding = 10;
      };
    };
  };

  home.packages = with pkgs; [
    waybar
    rofi
    dunst
    wl-clipboard
    grim
    slurp
    hyprpaper
    brightnessctl
    playerctl
    pavucontrol
  ];

  # Electron apps on Wayland
  home.sessionVariables.NIXOS_OZONE_WL = "1";
}
