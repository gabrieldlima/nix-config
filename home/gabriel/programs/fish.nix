{
  pkgs,
  ...
}: {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      starship init fish | source
      atuin init fish | source

      bind \cg expand-abbr
      bind \cw backward-kill-word
    '';
    functions = {
      fish_greeting = "";
    };
    shellAliases = {
      # List commands
      ls = "eza -l";
      ll = "eza -l";
      la = "eza -la";
      lt = "eza --tree";

      # Change dirs
      ".1" = "cd ..";
      ".2" = "cd ../..";
      ".3" = "cd ../../..";
      ".4" = "cd ../../../..";
      ".5" = "cd ../../../../..";

      cat = "bat";
    };
    shellAbbrs = {
      # Nix commands
      nr = "nix run nixpkgs#";
      ns = "nix shell nixpkgs#";
      ncg = "nix-collect-garbage --delete-old";
      nrs = "sudo nixos-rebuild switch --flake";

      # Home-Manager commands
      hms = "home-manager switch --flake";
      hmp = "home-manager packages";
      hmg = "home-manager generations";
      hmr = "home-manager remove-generations";

      # Git commands
      ga = "git add";
      gst = "git status";
      gsh = "git show";
      gd = "git diff";
      gc = "git commit";
      gl = "git log";
      gps = "git push -u origin main";
      gpl = "git pull";

      # Best editor ever
      n = "nvim";
      vi = "nvim";
      vim = "nvim";
      nano = "nvim";

      # Misc
      t = "tldr";
      df = "duf";
    };
    plugins = [
      # Pure-fish z directory jumping
      {
        name = "z";
        src = pkgs.fetchFromGitHub {
          owner = "jethrokuan";
          repo = "z";
          rev = "85f863f20f24faf675827fb00f3a4e15c7838d76";
          sha256 = "sha256-+FUBM7CodtZrYKqU542fQD+ZDGrd2438trKM0tIESs0=";
        };
      }

      # Fzf plugin for Fish
      {
        name = "fzf.fish";
        src = pkgs.fetchFromGitHub {
          owner = "PatrickF1";
          repo = "fzf.fish";
          rev = "e5d54b93cd3e096ad6c2a419df33c4f50451c900";
          sha256 = "sha256-5cO5Ey7z7KMF3vqQhIbYip5JR6YiS2I9VPRd6BOmeC8=";
        };
      }
    ];
  };
}
