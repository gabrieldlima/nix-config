{ pkgs, inputs, lib, config, ... }: {
  imports = [
    ./hardware-configuration.nix
  ];

  # NixOS release
  system.stateVersion = "23.05";
}
