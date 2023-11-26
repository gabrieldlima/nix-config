{
  pkgs,
  ...
}: {
  imports = [
    ./xmobar.nix
  ];

  xsession.windowManager.xmonad = {
    enable = true;
    enableContribAndExtras = true;
    config = ./xmonad.hs;
  };
}
