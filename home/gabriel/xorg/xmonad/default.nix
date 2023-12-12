{
  pkgs,
  ...
}: {
  imports = [
    ./xmobar.nix
  ];
  home.packages = with pkgs; [
    scrot
  ];

  xsession.windowManager.xmonad = {
    enable = true;
    enableContribAndExtras = true;
    config = ./xmonad.hs;
  };
}
