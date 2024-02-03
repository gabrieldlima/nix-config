{
  pkgs,
  ...
}: {
  programs.firefox = {
    enable = true;
    enableGnomeExtensions = false;
    package = pkgs.firefox;
    policies = {
      DefaultDownloadDirectory = "\${home}/Downloads";
      DownloadDirectory = "\${home}/Downloads";
      DisableBuiltinPDFViewer = true;
      DisablePasswordReveal = true;
      DisableProfileImport = true;
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      PrintingEnabled = false;
    };
  };
}
