{
  pkgs,
  ...
}: {
  programs.xmobar = {
    enable = false;
    extraConfig = ''
    Config {
             font     = "Vanilla Caramel Regular 12"
           , bgColor  = "#050508"
           , fgColor  = "#cdd6f4"
           , alpha    = 255
           , position = TopH 30
           , overrideRedirect = False
           , commands = [
                          Run XMonadLog
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
                        , Run Network "wlo1"
                            [
                              "--template", "<fc=#a6e3a1>󰖩 </fc><rx>KB/s"
                            ] 10
                        , Run Volume "default" "Master"
                            [
                              "--template", "<fc=#89b4fa>󰕾 </fc><volume>%"
                            ] 10
                        , Run Date "<fc=#cba6f7>󰥔 </fc>%I:%M %p" "time" 10
                        , Run Date "<fc=#a6e3a1>󰃭 </fc>%a %b %d" "date" 10
                        ]
           , sepChar  = "%"
           , alignSep = "}{"
           , template = "%XMonadLog% }{ %cpu% | %memory% | %disku% | %wlo1% | %default:Master% | %date% | %time%"
           }
    '';
  };
}
