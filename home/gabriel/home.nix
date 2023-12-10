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

    pointerCursor = {
      name = "Catppuccin-Mocha-Light-Cursors";
      package = pkgs.catppuccin-cursors.mochaLight;
      size = 24;
      x11 = {
        enable = true;
      };
    };
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
    iconTheme = {
      name = "Papirus";
      package = pkgs.papirus-icon-theme;
    };
  };

  xresources = {
    properties = {
      "XTerm*faceName" = "FiraCode Nerd Font:size=12";
      "Xcursor.theme" = "Catppuccin-Mocha-Light-Cursors";
      "Xcursor.size" = 24;
    };
    extraConfig = ''
      *background: #050508
      *foreground: #CDD6F4

      ! black
      *color0: #45475A
      *color8: #585B70

      ! red
      *color1: #F38BA8
      *color9: #F38BA8

      ! green
      *color2: #A6E3A1
      *color10: #A6E3A1

      ! yellow
      *color3: #F9E2AF
      *color11: #F9E2AF

      ! blue
      *color4: #89B4FA
      *color12: #89B4FA

      ! magenta
      *color5: #F5C2E7
      *color13: #F5C2E7

      ! cyan
      *color6: #94E2D5
      *color14: #94E2D5

      ! white
      *color7: #BAC2DE
      *color15: #A6ADC8
    '';
  };

  # Enable home-manager and git
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";
}
