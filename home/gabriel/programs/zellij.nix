{
  pkgs,
  ...
}: {
  programs.zellij = {
    enable = true;
    settings = {
      on_force_close = "quit";
      simplified_ui = false;
      pane_frames = true;
      default_shel = "fish";
      default_layout = "compact";
      default_mode = "normal";
      theme = "catppuccin-mocha-dark";
      themes = {
        catppuccin-mocha-dark =  {
          bg      = "#010101";
          fg      = "#cdd6f4";
          red     = "#f38ba8";
          green   = "#a6e3a1";
          blue    = "#89b4fa";
          yellow  = "#f9e2af";
          magenta = "#f5c2e7";
          orange  = "#fab387";
          cyan    = "#89dceb";
          black   = "#010101";
          white   = "#cdd6f4";
        };
      };
    };
  };
}
