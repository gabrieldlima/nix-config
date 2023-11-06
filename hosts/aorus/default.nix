{ pkgs, inputs, lib, config, ... }: {
  imports = [
    ./hardware-configuration.nix
  ];

  # Nix settings
  nix = {
    # This will add each flake input as a registry
    # To make nix3 commands consistent with your flake
    registry = lib.mapAttrs (_: value: {flake = value;}) inputs;

    # This will additionally add your inputs to the system's legacy channels
    # Making legacy nix commands consistent as well, awesome!
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;

    settings = {
      # Enable flakes and new 'nix' command
      experimental-features = "nix-command flakes";
      # Deduplicate and optimize nix store
      auto-optimise-store = true;
    };
  };

  # nixpkgs instance config
  nixpkgs = {
    config = {
      # Always allow unfree packages
      allowUnfree = true;
    };
  };

  # Bootloader
  boot.loader.systemd-boot.enable = true;

  # The time zone used when displaying times and dates
  time.timeZone = "America/Sao_Paulo";

  # Networking settings
  networking = {
    hostname = "aorus";
    networkmanager = {
      enable = true;
    };
  };

  # Enable the X11 windowing system
	services.xserver.enable = true;
	services.xserver.displayManager.startx.enable = true;

  # Enable the Pulseaudio sound server
	sound.enable = true;
	hardware.pulseaudio.enable = true;

  # NixOS release
  system.stateVersion = "23.05";
}
