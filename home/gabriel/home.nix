# ╔══════════════════════════════════════════════════════════════════════════════════════════════════════╗
# ║██╗  ██╗ ██████╗ ███╗   ███╗███████╗    ███╗   ███╗ █████╗ ███╗   ██╗ █████╗  ██████╗ ███████╗██████╗ ║
# ║██║  ██║██╔═══██╗████╗ ████║██╔════╝    ████╗ ████║██╔══██╗████╗  ██║██╔══██╗██╔════╝ ██╔════╝██╔══██╗║
# ║███████║██║   ██║██╔████╔██║█████╗█████╗██╔████╔██║███████║██╔██╗ ██║███████║██║  ███╗█████╗  ██████╔╝║
# ║██╔══██║██║   ██║██║╚██╔╝██║██╔══╝╚════╝██║╚██╔╝██║██╔══██║██║╚██╗██║██╔══██║██║   ██║██╔══╝  ██╔══██╗║
# ║██║  ██║╚██████╔╝██║ ╚═╝ ██║███████╗    ██║ ╚═╝ ██║██║  ██║██║ ╚████║██║  ██║╚██████╔╝███████╗██║  ██║║
# ║╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝    ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝║
# ╚══════════════════════════════════════════════════════════════════════════════════════════════════════╝

{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./programs
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  home = {
    username = "gabriel";
    homeDirectory = "/home/gabriel";
  };

  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Mocha-Compact-Lavender-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "lavender" ];
        size = "compact";
        tweaks = [ "black" "rimless" ];
        variant = "mocha";
      };
    };
  };

  # Enable home-manager and git
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";
}
