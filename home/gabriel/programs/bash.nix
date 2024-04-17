{
  pkgs,
  ...
}: {
  programs.bash = {
  enable = true;

  # Extra commands that should be run when initializing a login shell.
  profileExtra = ''
   if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
     exec Hyprland
   fi
  '';

  # Extra commands that should be run when initializing an interactive shell.
  # initExtra = ''
  #   NIX_LD= "$(nix eval --impure --raw --expr 'let pkgs = import <nixpkgs> {}; NIX_LD = pkgs.lib.fileContents '${pkgs.stdenv.cc}/nix-support/dynamic-linker'; in NIX_LD')";
  # '';
  };
}
