{
  pkgs,
  ...
}: {
  imports = [
    ./bat.nix
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
    fd
    firefox
    neovim
    nitrogen
    obsidian
    rofi
    scrot
  ];
}
