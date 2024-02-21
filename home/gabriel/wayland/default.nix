{
  pkgs,
  ...
}: {
  imports = [
    ./foot.nix
    ./hyprland
    # ./waybar.nix
  ];
  home.packages = with pkgs; [
    swww
    hyprpicker
    xdg-desktop-portal-hyprland
  ];
}
