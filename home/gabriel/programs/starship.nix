{
  pkgs,
  lib,
  ...
}: {
  programs.starship =
    let
      flavour = "mocha";
    in
    {
      enable = true;
      settings = {
        palette = "catppuccin_${flavour}";
        add_newline = true;
        character = {
          success_symbol = "[](green)";
          error_symbol = "[](red)";
        };
      } // builtins.fromTOML (builtins.readFile
        (pkgs.fetchFromGitHub
          {
            owner = "catppuccin";
            repo = "starship";
            rev = "5629d2356f62a9f2f8efad3ff37476c19969bd4f";
            sha256 = "sha256-nsRuxQFKbQkyEI4TXgvAjcroVdG+heKX5Pauq/4Ota0=";
          } + /palettes/${flavour}.toml));
    };
}
