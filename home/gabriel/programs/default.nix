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
    ./qutebrowser.nix
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
    jq
    neovim
    obsidian
    rofi
    socat
    sxiv
  ];
}
