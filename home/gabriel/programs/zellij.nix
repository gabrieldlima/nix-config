{
  pkgs,
  ...
}: {
  programs.zellij = {
    enable = true;
    settings = {
      on_force_close = "quit";
      simplified_ui = true;
      pane_frames = true;
      default_shel = "fish";
    };
  };
}
