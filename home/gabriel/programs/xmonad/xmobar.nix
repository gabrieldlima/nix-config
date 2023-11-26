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
                        , Run Cpu
                            [
                              "--template", "<fc=#b4befe> </fc><total>%"
                            , "--Low", "3"
                            , "--High", "50"
                            , "--low", "#cdd6f4"
                            , "--normal", "#cdd6f4"
                            , "--high", "#f38ba8"
                            ] 10
                        , Run Memory
                            [
                              "--template", "<fc=#f2cdcd>󰘚 </fc><used>GB"
                            , "--ddigits", "1"
                            , "--"
                            , "--scale", "1024"
                            ] 10
                        , Run DiskU
                            [("/", "<fc=#7dc4e4>󰆼 </fc><used>B")]
                            [
                              "--Low", "20"
                            , "--High", "50"
                            , "--minwidth", "1"
                            , "--ppad", "3"
                            ] 20
                        ]
           , sepChar  = "%"
           , alignSep = "}{"
           , template = "%XMonadLog% }{ %cpu% | %memory% | %disku% | %date% | %time%"
           }
    '';
  };
}
