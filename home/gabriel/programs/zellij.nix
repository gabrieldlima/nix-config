{
  pkgs,
  ...
}: {
  programs.zellij = {
    enable = true;
    settings = {
      default_shel = "fish";
    };
  };
}
