{
  pkgs,
  ...
}: {
  programs.foot = {
    enable = false;
    server = {
      enable = false;
    };

    settings = {
      main = {
        shell = "fish";
        app-id = "foot";
        title = "foot";
        font = "FiraCode Nerd Font:size=11";
        initial-window-size-pixels = "1000x500";
        pad = "5x5";
      };

      cursor = {
        style = "beam";
        blink = true;
      };

      mouse = {
        hide-when-typing = true;
      };

      colors = {
        alpha = "0.95";
        foreground = "cdd6f4"; # Text
        background = "050508"; # Base

        # Normal/regular colors (color palette 0-7)
        regular0 = "45475a"; # Surface 1
        regular1 = "f38ba8"; # red
        regular2 = "a6e3a1"; # green
        regular3 = "f9e2af"; # yellow
        regular4 = "89b4fa"; # blue
        regular5 = "f5c2e7"; # pink
        regular6 = "94e2d5"; # teal
        regular7 = "bac2de"; # Subtext 1

        # Bright colors (color palette 8-15)
        bright0 = "585b70";  # Surface 2
        bright1 = "f38ba8";  # red
        bright2 = "a6e3a1";  # green
        bright3 = "f9e2af";  # yellow
        bright4 = "89b4fa";  # blue
        bright5 = "f5c2e7";  # pink
        bright6 = "94e2d5";  # teal
        bright7 = "a6adc8";  # Subtext 0
      };
    };
  };
}
