{
  pkgs,
  ...
}: {
  imports = [
    ./hyprland
    ./waybar.nix
  ];
}
