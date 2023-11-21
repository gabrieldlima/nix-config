{
  pkgs,
  ...
}: {
  imports = [
    ./git.nix
    ./wezterm.nix
    ./fish.nix
    ./starship.nix
    ./fzf.nix
  ];
  home.packages = with pkgs; [
    _1password-gui
    eww
    firefox
    hello
    neovim
    nitrogen
    picom
    rofi
  ];
}