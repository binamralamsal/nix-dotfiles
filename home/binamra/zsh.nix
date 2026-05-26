{
  programs.zsh = {
    enable = true;

    shellAliases = {
      ll = "ls -la";
      gs = "git status";
    };

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initContent = ''
      bindkey -e
    '';
  };
}
