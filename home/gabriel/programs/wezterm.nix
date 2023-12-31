{
  pkgs,
  ...
}: {
  programs.wezterm = {
    enable = true;
    colorSchemes = {
      catppuccinMocha = {
        ansi = [
          "#45475a"
          "#f38ba8"
          "#a6e3a1"
          "#f9e2af"
          "#89b4fa"
          "#f5c2e7"
          "#94e2d5"
          "#bac2de"
        ];
        brights = [
          "#585b70"
          "#f38ba8"
          "#a6e3a1"
          "#f9e2af"
          "#89b4fa"
          "#f5c2e7"
          "#94e2d5"
          "#a6adc8"
        ];
        background = "#050508";
        compose_cursor = "#f2cdcd";
        cursor_bg = "#f5e0dc";
        cursor_border = "#f5e0dc";
        cursor_fg = "#11111b";
        foreground = "#cdd6f4";
        scrollbar_thumb = "#585b70";
        selection_bg = "#585b70";
        selection_fg = "#cdd6f4";
        split = "#6c7086";
        visual_bell = "#313244";
      };
    };
    extraConfig = ''
      return {
        color_scheme = "catppuccinMocha",
        window_background_opacity = 0.95,
        default_prog = { 'fish' },
        font = wezterm.font 'Fira Code Nerd Font',
        font_size = 12.0,
        enable_tab_bar = false,
        enable_wayland = true,
      }
    '';
  };
}
