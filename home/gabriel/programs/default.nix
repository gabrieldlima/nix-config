{
  pkgs,
  ...
}: {
  imports = [
    ./git.nix
    ./wezterm.nix
  ];
  home.packages = with pkgs; [
    hello
  ];
}
