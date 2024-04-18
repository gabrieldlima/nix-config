{
  pkgs,
  ...
}: {
  programs.alacritty = {
    enable = true;
    settings = {
      # GENERAL
      shell = "fish";

      # WINDOW
      window = {
        padding.x = 10;
        padding.y = 10;
      };

      # FONT
      font = {
        normal = {
          family = "FiraCode Nerd Font";
          style = "Regular";
        };
        bold = {
          family = "FiraCode Nerd Font";
          style = "Bold";
        };
        italic = {
          family = "FiraCode Nerd Font";
          style = "Italic";
        };
        bold_italic = {
          family = "FiraCode Nerd Font";
          style = "Bold Italic";
        };
        size = 12;
      };
    };
  };
}
