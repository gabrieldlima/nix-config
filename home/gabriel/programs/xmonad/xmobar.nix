{
  pkgs,
  ...
}: {
  programs.xmobar = {
    enable = true;
    extraConfig = ''
    Config {
             font     = "Sugar Snow Regular 11"
           , bgColor  = "#050508"
           , fgColor  = "#cdd6f4"
           , alpha    = 255
           , position = TopH 30
           , overrideRedirect = False
           , commands = [
                          Run Date "<fc=#cba6f7>󰥔 </fc>%I:%M %p" "time" 10
                        , Run Date "<fc=#a6e3a1>󰃭 </fc>%a %b %d" "date" 10
                        , Run XMonadLog
                        ]
           , sepChar  = "%"
           , alignSep = "}{"
           , template = "%XMonadLog% }{ %date% | %time%"
           }
    '';
  };
}
