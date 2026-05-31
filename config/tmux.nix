{ config, pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "tmux-256color";
    mouse = true;
    baseIndex = 1;
    keyMode = "vi";
    sensibleOnTop = true;

    extraConfig = ''
      set-option -sa terminal-overrides ',kitty:RGB'

      set -g pane-base-index 1
      set-window-option -g pane-base-index 1
      set-option -g renumber-windows on
      set -g status-position top

      # Vim style pane selection
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      # Window navigation
      bind -n M-h previous-window
      bind -n M-l next-window
      bind -n M-n new-window
      bind -n M-x kill-window

      # Arrow key pane switching
      bind -n M-Left select-pane -L
      bind -n M-Right select-pane -R
      bind -n M-Up select-pane -U
      bind -n M-Down select-pane -D

      # Vi copy mode
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
      bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel

      # Split in current path
      bind '"' split-window -v -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}"

      # Reload config
      unbind r
      bind r source-file ~/.config/tmux/tmux.conf

      # Catppuccin
      set -g @catppuccin_window_number_position "right"
      set -g @catppuccin_window_right_separator " "
      set -g @catppuccin_window_middle_separator " | "
      set -g @catppuccin_window_default_fill "none"
      set -g @catppuccin_window_current_fill "all"
      set -g @catppuccin_status_modules_right "session directory date_time"
      set -g @catppuccin_status_left_separator " "
      set -g @catppuccin_status_right_separator ""
      set -g @catppuccin_status_right_separator_inverse "no"
      set -g @catppuccin_status_fill "icon"
      set -g @catppuccin_status_connect_separator "no"
      set -g @catppuccin_date_time_text "%Y-%m-%d %H:%M:%S"
    '';

    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
      yank
      catppuccin
    ];
  };
}
