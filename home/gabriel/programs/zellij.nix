{
  pkgs,
  ...
}: {
  programs.zellij = {
    enable = true;
    settings = {
      on_force_close = "quit";
      default_shel = "fish";
    };
  };
}
