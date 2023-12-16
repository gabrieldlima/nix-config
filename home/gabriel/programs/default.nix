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
    ./starship.nix
    ./tmux.nix
    ./wezterm.nix
    ./zathura.nix
  ];
  home.packages = with pkgs; [
    _1password-gui
    brave
    discord
    fd
    gimp
    hyprpaper
    neovim
    obsidian
    rofi
    sxiv
  ];
}
