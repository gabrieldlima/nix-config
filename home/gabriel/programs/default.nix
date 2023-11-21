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
    ./eza.nix
  ];
  home.packages = with pkgs; [
    _1password-gui
    fd
    eww
    firefox
    hello
    neovim
    nitrogen
    picom
    rofi
  ];
}
