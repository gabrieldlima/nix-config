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
    ./kitty.nix
    ./qutebrowser.nix
    ./starship.nix
    ./steam.nix
    ./tmux.nix
    ./wezterm.nix
    ./zathura.nix
  ];
  home.packages = with pkgs; [
    _1password-gui
    anki
    discord
    fd
    gimp
    gnumake
    jq
    neovim
    obinskit
    obsidian
    ripgrep
    rofi
    scrot
    socat
    sxiv
    unzip
    xwallpaper
  ];
}
