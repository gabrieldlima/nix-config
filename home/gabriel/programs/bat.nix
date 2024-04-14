{
  pkgs,
  ...
}: {
  programs.bat = {
    enable = true;
    themes = {
      catppuccinMocha = {
        src = pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "bat";
          rev = "b8134f0";
          sha256 = "sha256-gzf0/Ltw8mGMsEFBTUuN33MSFtUP4xhdxfoZFntaycQ=";
        };
        file = "Catppuccin-mocha.tmTheme";
      };
    };
    config = {
      theme = "catppuccinMocha";
    };
  };
}
