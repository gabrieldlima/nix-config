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
      DisableBuiltinPDFViewer = true;
      DisableFirefoxAccounts = false;
      DisablePasswordReveal = true;
      DisablePocket = true;
      DisableProfileImport = true;
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      DownloadDirectory = "\${home}/Downloads";
      PrintingEnabled = false;
      FirefoxHome = {
        "Search" = false;
        "TopSites" = false;
        "SponsoredTopSites" = false;
        "Highlights" = false;
        "Pocket" = false;
        "SponsoredPocket" = false;
        "Snippets" = false;
        "Locked" = false;
      };
    };
    # profiles = {
    #   gabriel = {
    #     search = {
    #       default = "DuckDuckGo";
    #     };
    #   };
    # };
  };
}
