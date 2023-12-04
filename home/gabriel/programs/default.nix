{
  pkgs,
  ...
}: {
  imports = [
    ./bat.nix
    ./eww.nix
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
    discord
    google-chrome
    fd
    firefox
    neovim
    nitrogen
    obsidian
    rofi
    scrot
  ];
}
