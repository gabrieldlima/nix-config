{
  pkgs,
  ...
}: {
  programs.fish = {
    enable = true;
    interactiveShellInit = "starship init fish | source";
  };
}
