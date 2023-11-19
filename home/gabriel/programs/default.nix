{
  pkgs,
  ...
}: {
  imports = [
    ./git.nix
    ./wezterm.nix
  ];
  home.packages = with pkgs; [
    _1password-gui
    eww
    firefox
    fish
    hello
    neovim
    nitrogen
    picom
    rofi
    starship
  ];
}
