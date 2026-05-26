{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "binamralamsal";
        email = "binamralamsal@gmail.com";
      };

      init.defaultBranch = "main";

      pull.rebase = true;
    };
  };
}
