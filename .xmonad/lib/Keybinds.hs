module Keybinds where 

------------------------------------------------------------------------  
-- Imports
--

import XMonad
import System.Exit
import XMonad.Util.Run
import XMonad.Actions.CycleWS
import qualified XMonad.StackSet as W

------------------------------------------------------------------------
-- Modifier
--

modifier = mod4Mask

------------------------------------------------------------------------
-- Keybinds
--

keybinds workspaces = 
    -- Launch apps

    [ ("M-s <Return>", spawn ("alacritty"))               -- Terminal
    , ("M-s m", spawn ("alacritty -e spt"))               -- Spotify-TUI
    , ("M-s i", spawn ("alacritty -e weechat"))           -- Weechat (IRC)
    , ("M-s v", spawn ("vim"))                            -- Vim 
    , ("M-s e", spawn ("emacs"))                          -- Emacs

    , ("M-s b b", spawn ("firefox"))                      -- Firefox
    , ("M-s b p", spawn ("firefox --private-window"))
    , ("M-s b a", spawn ("firefox wiki.archlinux.org"))   -- Firefox - Arch Wiki
    , ("M-s b y", spawn ("firefox news.ycombinator.com")) -- Firefox - Hacker News

    , ("M-s b m y", spawn ("firefox youtube.com"))        -- Firefox - YouTube
    , ("M-s b m n", spawn ("firefox netflix.com"))        -- Firefox - Netflix
    , ("M-s b m p", spawn ("firefox primevideo.com"))     -- Firefox - Prime Video

    -- Navigation and Window Controls

    , ("M-<Left>", windows W.focusUp)         -- Move focus to last window.
    , ("M-<Right>", windows W.focusDown)      -- Move focus to next window.
    , ("M-S-<Left>", windows W.swapUp)        -- Swap with last window.
    , ("M-S-<Right>", windows W.swapDown)     -- Swap with next window.

    , ("M-<Space>", sendMessage NextLayout)   -- Switch to next layout.

    , ("M-j", sendMessage Shrink)             -- Shrink master area.
    , ("M-k", sendMessage Expand)             -- Expand master area.

    , ("M-a", prevWS)                         -- Switch to previous workspace.
    , ("M-d", nextWS)                         -- Switch to next workspace.

    , ("M-q", kill)                           -- Kill focused window.

    , ("M-x w t", withFocused $ windows . W.sink)
    , ("M-x w f", withFocused $ windows . (flip W.float $ W.RationalRect 0 0 1 1))

    -- XMonad Control
    
    , ("M-x r", spawn ("xmonad --recompile; xmonad --restart")) -- Recompile and restart XMonad.
    , ("M-x l", spawn ("i3lock -c 262930"))                     -- Lock screen.
    , ("<F4>", spawn ("i3lock -c 262930"))                      -- Lock screen. (F4)
    , ("M-x e", io (exitWith ExitSuccess))                      -- Exit XMonad.

    -- System Control

    , ("M-x s d d", spawn ("shutdown 0"))    -- Shutdown.
    , ("M-x s r r", spawn ("shutdown -r 0")) -- Restart.

    -- Playback and Audio Control

    , ("<XF86AudioLowerVolume>", spawn ("pulseaudio-ctl down 2"))    -- Volume down.
    , ("<XF86AudioRaiseVolume>", spawn ("pulseaudio-ctl up 2"))      -- Volume up.
    , ("<XF86AudioPrev>", spawn ("playerctl previous"))              -- Last track.
    , ("<XF86AudioPlay>", spawn ("~/.xmonad/scripts/play-pause.sh")) -- Play/pause.
    , ("<XF86AudioNext>", spawn ("playerctl next"))                  -- Next track.

    -- Miscellaneous

    , ("M1-<Space>", spawn "rofi -show")
    , ("<Print>", spawn "import -window root \"$HOME/Screenshots/$(date '+%Y-%m-%d-%T').png\"")
    , ("C-<Print>", spawn "import \"$HOME/Screenshots/$(date '+%Y-%m-%d-%T').png\"")
    ]
    -- Workspace Keys
    ++
    [ (otherModMasks ++ "M-" ++ key, action tag)
        | (tag, key)  <- zip workspaces (map (\x -> show x)  [1..12])
        , (otherModMasks, action) <- [ ("", windows . W.greedyView) -- or W.view
                                     , ("S-", windows . W.shift)]
    ]
