{
  pkgs,
  ...
}: {
  # Xmonad and Xmonad-Contrib
  xsession.windowManager.xmonad = {
    enable = true;
    enableContribAndExtras = true;
    config = ./xmonad.hs;
  };

  # Xmobar
  programs.xmobar = {
    enable = true;
  };
}
