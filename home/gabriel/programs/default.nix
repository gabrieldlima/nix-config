{
  pkgs,
  ...
}: {
  imports = [
    # =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    # Wayland
    # =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    ./dunst.nix
    # ./eww
    ./hyprland
    # ./waybar.nix

    # =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    # Xorg
    # =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    # ./awesome.nix
    # ./picom.nix
    # ./xmonad
    # ./xresources.nix

    # =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    # Terminal emulators
    # =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    ./alacritty.nix
    ./foot.nix
    ./kitty.nix
    ./wezterm.nix

    # =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    # Web browsers
    # =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    ./firefox.nix
    ./qutebrowser.nix

    # =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    # Command-line
    # =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    ./atuin.nix
    ./bash.nix
    ./bat.nix
    ./eza.nix
    ./fish.nix
    ./fzf.nix
    ./git.nix
    ./starship.nix
    ./tmux.nix
    ./yazi.nix
    ./zellij.nix

    # =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    # Misc
    # =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    ./mangohud.nix
    ./mpv.nix
    # ./steam.nix
    ./zathura.nix
  ];
  home.packages = with pkgs; [
    _1password-gui
    duf
    fd
    file
    gimp
    gnome.gnome-themes-extra
    gnumake
    jq
    neovim
    obsidian
    pavucontrol
    ripgrep
    virtiofsd
    tldr
    unzip
    wget
  ];
}
