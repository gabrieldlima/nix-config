{
  pkgs,
  ...
}: {
  imports = [
    ./bat.nix
    ./eww
    ./eza.nix
    ./fish.nix
    ./fzf.nix
    ./git.nix
    ./picom.nix
    ./starship.nix
    ./tmux.nix
    ./wezterm.nix
    ./xmonad
    ./zathura.nix
  ];
  home.packages = with pkgs; [
    _1password-gui
    brave
    discord
    fd
    neovim
    nitrogen
    obsidian
    rofi
    scrot
    wmctrl
  ];
}
