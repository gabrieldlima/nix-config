{
  pkgs,
  ...
}: {
  imports = [
    # ./eww
    # ./foot.nix
    # ./hyprland
    # ./waybar.nix
  ];
  home.packages = with pkgs; [
    # hyprpaper
    # hyprpicker
    # xdg-desktop-portal-hyprland
  ];
}
