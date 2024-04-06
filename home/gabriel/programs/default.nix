{
  pkgs,
  ...
}: {
  imports = [
    # ./hyprland
    # ./xmonad
    ./awesome.nix
    ./bat.nix
    ./bash.nix
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
    ./zathura.nix
  ];
  home.packages = with pkgs; [
    _1password-gui
    fd
    gimp
    gnumake
    jq
    neovim
    obsidian
    ripgrep
    scrot
    sxiv
    unzip
    wget
    xwallpaper
  ];
}
