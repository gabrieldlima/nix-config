{
  pkgs,
  ...
}: {
  xsession.windowManager.awesome = {
    enable = true;
    package = pkgs.awesome;
  };
}
