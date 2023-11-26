{
  pkgs,
  ...
}: {
  programs.xmobar = {
    enable = true;
    extraConfig = ''
    Config {
             overrideRedirect = False
           , font     = "Vanilla Caramel Regular 12"
           , bgColor  = "#050508"
           , fgColor  = "#cdd6f4"
           , position = TopW L 100
           , commands = [
                          Run Weather "EGPF"
                            [ "--template", "<weather> <tempC>°C"
                            , "-L", "0"
                            , "-H", "25"
                            , "--low"   , "lightblue"
                            , "--normal", "#f8f8f2"
                            , "--high"  , "red"
                            ] 36000
                        , Run Cpu
                            [ "-L", "3"
                            , "-H", "50"
                            , "--high"  , "red"
                            , "--normal", "green"
                            ] 10
                        , Run Alsa "default" "Master"
                            [ "--template", "<volumestatus>"
                            , "--suffix"  , "True"
                            , "--"
                            , "--on", ""
                            ]
                        , Run Memory ["--template", "Mem: <usedratio>%"] 10
                        , Run Swap [] 10
                        , Run Date "%a %Y-%m-%d <fc=#8be9fd>%H:%M</fc>" "date" 10
                        , Run XMonadLog
                        ]
           , sepChar  = "%"
           , alignSep = "}{"
           , template = "%XMonadLog% }{ %alsa:default:Master% | %cpu% | %memory% * %swap% | %EGPF% | %date% "
           }
    '';
  };
}
