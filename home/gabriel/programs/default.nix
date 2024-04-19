{
  pkgs,
  ...
}: {
  imports = [
    # ./awesome.nix
    # ./waybar.nix
    # ./xmonad
    # ./xresources.nix
    ./alacritty.nix
    ./atuin.nix
    ./bash.nix
    ./bat.nix
    ./dunst.nix
    ./eza.nix
    ./firefox.nix
    ./fish.nix
    ./fzf.nix
    ./git.nix
    ./hyprland
    ./kitty.nix
    ./mangohud.nix
    ./picom.nix
    ./qutebrowser.nix
    ./starship.nix
    ./steam.nix
    ./tmux.nix
    ./wezterm.nix
    ./yazi.nix
    ./zathura.nix
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
    #scrot
    #sxiv
    tldr
    unzip
    wget
    #xsel
    #xwallpaper
  ];
}
