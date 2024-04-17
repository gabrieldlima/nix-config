{
  pkgs,
  ...
}: {
  programs.alacritty = {
    enable = true;
    settings = {
      shell = "fish";
    };
  };
}
