{
  pkgs,
  ...
}:
let
  rosewater = "#f5e0dc";
  flamingo  = "#f2cdcd";
  pink      = "#f5c2e7";
  mauve     = "#cba6f7";
  red       = "#f38ba8";
  maroon    = "#eba0ac";
  peach     = "#fab387";
  yellow    = "#f9e2af";
  green     = "#a6e3a1";
  teal      = "#94e2d5";
  sky       = "#89dceb";
  sapphire  = "#74c7ec";
  blue      = "#89b4fa";
  lavender  = "#b4befe";
  text      = "#cdd6f4";
  subtext1  = "#bac2de";
  subtext0  = "#a6adc8";
  overlay2  = "#9399b2";
  overlay1  = "#7f849c";
  overlay0  = "#6c7086";
  surface2  = "#585b70";
  surface1  = "#45475a";
  surface0  = "#313244";
  base      = "#010101";
  mantle    = "#010101";
  crust     = "#010101";
in
{
  programs.yazi = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;

    theme = {
      manager = {
        cwd = { fg = "${teal}"; };

        # Hovered
        hovered         = { fg = "${base}"; bg = "${blue}"; };
        preview_hovered = { underline = true; };

        # Find
        find_keyword  = { fg = "${yellow}"; italic = true; };
        find_position = { fg = "${pink}"; bg = "reset"; italic = true; };

        # Marker
        marker_copied   = { fg = "${green}"; bg = "${green}"; };
        marker_cut      = { fg = "${red}"; bg = "${red}"; };
        marker_selected = { fg = "${blue}"; bg = "${blue}"; };

        # Tab
        tab_active   = { fg = "${base}"; bg = "${text}"; };
        tab_inactive = { fg = "${text}"; bg = "${surface1}"; };
        tab_width    = 1;

        # Count
        count_copied   = { fg = "${base}"; bg = "${green}"; };
        count_cut      = { fg = "${base}"; bg = "${red}"; };
        count_selected = { fg = "${base}"; bg = "${blue}"; };

        # Border
        border_symbol = "│";
        border_style  = { fg = "${overlay1}"; };

        # Highlighting
        syntect_theme = "~/.config/bat/themes/catppuccinMocha.tmTheme";
      };

      status = {
        separator_open  = "";
        separator_close = "";
        separator_style = { fg = "${surface1}"; bg = "${surface1}"; };

        # Mode
        mode_normal = { fg = "${base}"; bg = "${blue}"; bold = true; };
        mode_select = { fg = "${base}"; bg = "${green}"; bold = true; };
        mode_unset  = { fg = "${base}"; bg = "${flamingo}"; bold = true; };

        # Progress
        progress_label  = { fg = "#ffffff"; bold = true; };
        progress_normal = { fg = "${blue}"; bg = "${surface1}"; };
        progress_error  = { fg = "${red}"; bg = "${surface1}"; };

        # Permissions
        permissions_t = { fg = "${blue}"; };
        permissions_r = { fg = "${yellow}"; };
        permissions_w = { fg = "${red}"; };
        permissions_x = { fg = "${green}"; };
        permissions_s = { fg = "${overlay1}"; };
      };

      input = {
        border   = { fg = "${blue}"; };
        title    = {};
        value    = {};
        selected = { reversed = true; };
      };

      select = {
        border   = { fg = "${blue}"; };
        active   = { fg = "${pink}"; };
        inactive = {};
      };

      tasks = {
        border  = { fg = "${blue}"; };
        title   = {};
        hovered = { underline = true; };
      };

      which = {
        mask            = { bg = "${surface0}"; };
        cand            = { fg = "${teal}"; };
        rest            = { fg = "${overlay2}"; };
        desc            = { fg = "${pink}"; };
        separator       = "  ";
        separator_style = { fg = "${surface2}"; };
      };

      help = {
        on      = { fg = "${pink}"; };
        exec    = { fg = "${teal}"; };
        desc    = { fg = "${overlay2}"; };
        hovered = { bg = "${surface2}"; bold = true; };
        footer  = { fg = "${surface1}"; bg = "${text}"; };
      };

      filetype = {
        rules = [
          # Images
          { mime = "image/*"; fg = "${teal}"; }

          # Videos
          { mime = "video/*"; fg = "${yellow}"; }
          { mime = "audio/*"; fg = "${yellow}"; }

          # Archives
          { mime = "application/zip";             fg = "${pink}"; }
          { mime = "application/gzip";            fg = "${pink}"; }
          { mime = "application/x-tar";           fg = "${pink}"; }
          { mime = "application/x-bzip";          fg = "${pink}"; }
          { mime = "application/x-bzip2";         fg = "${pink}"; }
          { mime = "application/x-7z-compressed"; fg = "${pink}"; }
          { mime = "application/x-rar";           fg = "${pink}"; }

          # Fallback
          { name = "*"; fg = "${text}"; }
          { name = "*/"; fg = "${blue}"; }
        ];
      };
    };
  };
}
