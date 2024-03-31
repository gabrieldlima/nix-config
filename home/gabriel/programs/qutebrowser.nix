{
  pkgs,
  ...
}:
let
  rosewater = "#f5e0dc";
  flamingo  = "#f2cdcd";
  pink      = "#f5c2e7";
  mauve     = "#cba6f7";
  red       = "#f38ba8";
  maroon    = "#eba0ac";
  peach     = "#fab387";
  yellow    = "#f9e2af";
  green     = "#a6e3a1";
  teal      = "#94e2d5";
  sky       = "#89dceb";
  sapphire  = "#74c7ec";
  blue      = "#89b4fa";
  lavender  = "#b4befe";
  text      = "#cdd6f4";
  subtext1  = "#bac2de";
  subtext0  = "#a6adc8";
  overlay2  = "#9399b2";
  overlay1  = "#7f849c";
  overlay0  = "#6c7086";
  surface2  = "#585b70";
  surface1  = "#45475a";
  surface0  = "#313244";
  base      = "#050508";
  mantle    = "#050508";
  crust     = "#050508";
in
{
  programs.qutebrowser = {
    enable = true;

    quickmarks = {
      awesomewm    = "https://awesomewm.org/apidoc/";
			chatgpt      = "https://chat.openai.com/";
      drive        = "https://drive.google.com/drive/my-drive";
      github       = "https://github.com/dashboard";
      hacker_news  = "https://news.ycombinator.com/";
      home-manager = "https://nix-community.github.io/home-manager/options.xhtml";
      nixpkgs      = "https://search.nixos.org/packages";
      reddit       = "https://www.reddit.com/";
      youtube      = "https://www.youtube.com/";
    };

    settings = {
      fonts = {
        default_family = "FiraCode Nerd Font";
        default_size   = "10pt";
      };

      colors = {
        completion = {
          category.bg                 = "${base}";
          category.border.bottom      = "${mantle}";
          category.border.top         = "${overlay2}";
          category.fg                 = "${green}";
          fg                          = "${subtext0}";
          item.selected.bg            = "${surface2}";
          item.selected.border.bottom = "${surface2}";
          item.selected.border.top    = "${surface2}";
          item.selected.fg            = "${text}";
          item.selected.match.fg      = "${rosewater}";
          even.bg                     = "${base}";
          odd.bg                      = "${base}";
          match.fg                    = "${green}";
          scrollbar.bg                = "${crust}";
          scrollbar.fg                = "${surface2}";
        };

        downloads = {
          bar.bg    = "${base}";
          error.bg  = "${base}";
          start.bg  = "${base}";
          stop.bg   = "${base}";
          error.fg  = "${red}";
          start.fg  = "${blue}";
          stop.fg   = "${green}";
          system.fg = "none";
          system.bg = "none";
        };

        hints = {
          bg       = "${peach}";
          fg       = "${mantle}";
          match.fg = "${subtext1}";
        };

        keyhint = {
          bg        = "${mantle}";
          fg        = "${text}";
          suffix.fg = "${subtext1}";
        };

        messages = {
          error.bg       = "${overlay0}";
          info.bg        = "${overlay0}";
          warning.bg     = "${overlay0}";
          error.border   = "${mantle}";
          info.border    = "${mantle}";
          warning.border = "${mantle}";
          error.fg       = "${red}";
          info.fg        = "${text}";
          warning.fg     = "${peach}";
        };

        prompts = {
          bg          = "${mantle}";
          border      = "${overlay0}";
          fg          = "${text}";
          selected.bg = "${surface2}";
          selected.fg = "${rosewater}";
        };

        statusbar = {
          normal.bg            = "${base}";
          insert.bg            = "${crust}";
          command.bg           = "${base}";
          caret.bg             = "${base}";
          caret.selection.bg   = "${base}";
          progress.bg          = "${base}";
          passthrough.bg       = "${base}";
          normal.fg            = "${text}";
          insert.fg            = "${rosewater}";
          command.fg           = "${text}";
          passthrough.fg       = "${peach}";
          caret.fg             = "${peach}";
          caret.selection.fg   = "${peach}";
          url.error.fg         = "${red}";
          url.fg               = "${text}";
          url.hover.fg         = "${sky}";
          url.success.http.fg  = "${teal}";
          url.success.https.fg = "${green}";
          url.warn.fg          = "${yellow}";
          private.bg           = "${mantle}";
          private.fg           = "${subtext1}";
          command.private.bg   = "${base}";
          command.private.fg   = "${subtext1}";
        };

        tabs = {
          bar.bg           = "${crust}";
          even.bg          = "${surface2}";
          odd.bg           = "${surface1}";
          even.fg          = "${overlay2}";
          odd.fg           = "${overlay2}";
          indicator.error  = "${red}";
          indicator.system = "none";
          selected.even.bg = "${base}";
          selected.odd.bg  = "${base}";
          selected.even.fg = "${text}";
          selected.odd.fg  = "${text}";
        };

        contextmenu = {
          menu.bg     = "${base}";
          menu.fg     = "${text}";
          disabled.bg = "${mantle}";
          disabled.fg = "${overlay0}";
          selected.bg = "${overlay0}";
          selected.fg = "${rosewater}";
        };
      };
    };
  };
}
