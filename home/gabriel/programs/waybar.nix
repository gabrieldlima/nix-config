{
  pkgs,
  ...
}: {
  programs.waybar = {
    enable = true;

    # JSON
    settings = {
      waybar = {
        # Decide if the bar is displayed in front (top) of the window or behind (bottom) them
        layer = "bottom";
        # Which output (monitor), the bar should appear
        output = [
          "HDMI-A-1"
        ];
        # Bar position, can be top, bottom, left, right
        position = "top";
        # Height to be used by the bar if possible
        height = 30;
        # Width to be used by the bar if possible
        width = 1920;

        # Modules that will be displayed on the left, center and right
        modules-left = [ "image" "hyprland/window" ];
        modules-center = [];
        modules-right = ["clock"];

        # Margins value using the css format without units
        margin-top = 0;
        # Size of gaps in between of the different modules
        spacing = 4;
        # Optional name added as a CSS class, for styling multiples waybars
        name = "waybar";
        # Option to start the bar hidden
        start_hidden = false;
        # Request an exclusive zone from the compositor
        exclusive = true;
        # Prefer fixed center position for the modules-center block
        fixed-center = true;

        # Modules
        clock = {
          interval = 60;
          format = "{:%I:%M %p}";
          timezone = "America/Sao_Paulo";
          tooltip = true;
          tooltip-format = "{:%A, %B %d}";
        };

        image = {
          path = "/home/gabriel/.config/waybar/logo.png";
          size = 24;
        };

        "hyprland/window" = {
          format = "{title}";
        };
      };
    };

    # CSS
    style = ''
      * {
        font-family: Vanilla Caramel;
        color: @theme_text_color;
        background: @theme_base_color;
        border-radius: 0px;
        padding-left: 1px;
        padding-right: 1px;
      }
    '';
  };
}
