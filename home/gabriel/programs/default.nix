{
  pkgs,
  ...
}: {
  imports = [
    # ./dunst.nix
    # ./eww
    # ./foot.nix
    # ./hyprland
    # ./waybar.nix
    # ./xmonad
    ./alacritty.nix
    ./atuin.nix
    ./awesome.nix
    ./bash.nix
    ./bat.nix
    ./eza.nix
    ./firefox.nix
    ./fish.nix
    ./fzf.nix
    ./git.nix
    ./kitty.nix
    ./mangohud.nix
    ./picom.nix
    ./qutebrowser.nix
    ./starship.nix
    ./steam.nix
    ./tmux.nix
    ./wezterm.nix
    ./xresources.nix
    ./yazi.nix
    ./zathura.nix
    ./zellij.nix
  ];
  home.packages = with pkgs; [
    _1password-gui
    duf
    fd
    file
    gimp
    gnumake
    jq
    neovim
    obsidian
    ripgrep
    rofi-wayland
    scrot
    sxiv
    tldr
    unzip
    wget
    xsel
    xwallpaper
  ];
}
