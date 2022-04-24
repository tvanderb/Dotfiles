Config { font = "xft:Ubuntu:pixelsize=12:antialias=true:hinting=true:style=bold"
       , additionalFonts = [ "xft:Ubuntu:pixelsize=12:antialias=true:hinting=true"
                           , "xft:Font Awesome 6 Free Solid:pixelsize=14:antialias=true:hinting=true"
                           -- , "xft:Font Awesome 6 Brands Regular:pixelsize=14:antialias=true:hinting=true"
                           ]
       , border = BottomB
       , borderWidth = 2
       , borderColor = "#8fbcbb"
       , bgColor = "#262930"
       , fgColor = "#5e81ac"
       , alpha = 255
       , position = Static { xpos = 0, ypos = 0, width = 1920, height = 30 }
       -- , position = Static { xpos = 20, ypos = 20, width = 1880, height = 30 }
       -- , textOffset = -1
       -- , iconOffset = -1
       , lowerOnStart = True
       , pickBroadest = False
       , persistent = False
       , hideOnStart = False
       , iconRoot = "."
       , allDesktops = True
       , overrideRedirect = True
       , commands = [ Run Com         "echo" ["<fc=#4c566a> || </fc>"] "spacer" 0

                    , Run Com         "echo" ["<fc=#8fbcbb><fn=2>\xf6fc</fn></fc>"] "logo" 0

                    , Run Com         "echo" ["#5e81ac"] "sysinfo" 0
                    , Run Com         "echo" ["#b48ead"] "volumec" 0
                    , Run Com         "echo" ["#b48ead"] "nordc" 0
                    , Run Com         "echo" ["#88c0d0"] "datec" 0

                    , Run Com         "echo" ["<fn=2>\xf538</fn>"] "mem-ico" 0
                    , Run Memory      ["-t", "<usedratio>%"] 10

                    , Run Com         "echo" ["<fn=2>\xf2db</fn>"] "cpu-ico" 0
                    , Run Cpu         ["-t", "<total>%"] 10

                    , Run Com         "echo" ["<fn=2>\xf0a0</fn>"] "hdd-ico" 0
                    , Run DiskU       [("/", "<free>")] [] 60

                    , Run Com         "echo" ["<fn=2>\xf028</fn>"] "volume-ico" 0
                    , Run Com         "bash" ["/home/extropy/.config/xmobar/volume.sh"] "volume" 1 

                    , Run Com         "bash" ["/home/extropy/.config/xmobar/nordvpn.sh"] "vpn" 10

                    , Run Com         "echo" ["<fn=2>\xf073</fn>"] "datetime-ico" 0
                    , Run Date        "%m/%d/%y %-I:%M %p" "date" 1

                    , Run StdinReader
                    ]
       , sepChar = "%"
       , alignSep = "}{"
       , template = "    %logo% %StdinReader%}{<fc=%sysinfo%>%mem-ico%   mem: %memory%</fc>   %spacer%   <fc=%sysinfo%>%cpu-ico%   cpu: %cpu%</fc>   %spacer%   <fc=%sysinfo%>%hdd-ico%   free: %disku%</fc>   %spacer%   <fc=%volumec%>%volume-ico%   %volume%</fc>   %spacer%   <fc=%nordc%><fn=2>%vpn%</fn></fc>   %spacer%   <fc=%datec%>%datetime-ico%   %date%</fc>     "
       }
