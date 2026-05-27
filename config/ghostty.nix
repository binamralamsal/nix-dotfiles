{ pkgs, ... }:

{
  programs.ghostty = {
    enable = true;

    settings = {
      theme = "Xcode Dark hc";

      font-family = "JetBrainsMono Nerd Font";

      background-opacity = 0.8;
      background-blur = true;
    };
  };
}
