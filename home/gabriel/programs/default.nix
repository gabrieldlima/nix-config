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
    ./bat.nix
    ./zathura.nix
  ];
  home.packages = with pkgs; [
    _1password-gui
    fd
    firefox
    hello
    neovim
    nitrogen
    picom
    rofi
  ];
}
