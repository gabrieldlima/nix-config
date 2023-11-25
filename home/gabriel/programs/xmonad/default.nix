{
  pkgs,
  ...
}: {
  # Xmonad and Xmonad-Contrib
  xsession.windowManager.xmonad = {
    enable = true;
    enableContribAndExtras = true;
  };

  # Xmobar
  programs.xmobar = {
    enable = true;
  };
}
