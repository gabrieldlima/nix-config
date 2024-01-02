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
    ./kitty.nix
    ./qutebrowser.nix
    ./starship.nix
    ./tmux.nix
    # ./wezterm.nix
    ./zathura.nix
  ];
  home.packages = with pkgs; [
    _1password-gui
    anki
    discord
    fd
    gimp
    hyprpaper
    jq
    neovim
    obsidian
    rofi
    socat
    sxiv
    xdg-desktop-portal-hyprland
  ];
}
