{
  pkgs,
  ...
}: {
  programs.firefox = {
    enable = false;
    enableGnomeExtensions = false;
    package = pkgs.firefox;
    policies = {
      DefaultDownloadDirectory = "\${home}/Downloads";
      DisableBuiltinPDFViewer = true;
      DisableFirefoxAccounts = true;
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
    profiles = {
      gabriel = {
        search = {
          default = "DuckDuckGo";
        };
      };
    };
  };
}
