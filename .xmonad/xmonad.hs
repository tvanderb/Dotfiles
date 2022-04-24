------------------------------------------------------------------------  
-- Imports
--

import XMonad
import System.Exit

  -- UTIL

import XMonad.Util.Run
import XMonad.Util.SpawnOnce
import XMonad.Util.EZConfig

  -- HOOKS

import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks

  -- MODULAR CONFIGURATION

import qualified Colors      as C -- ./lib/Colors.hs
import qualified Keybinds    as K -- ./lib/Keybinds.hs
import qualified XMobar      as B -- ./lib/XMobar.hs
import qualified Layouts     as L -- ./lib/Layouts.hs
import qualified WindowRules as R -- ./lib/WindowRules.hs

------------------------------------------------------------------------
-- Workspaces
--

myWorkspaces    = [ "1: www"
                  , "2: dev"
                  , "3: sys"
                  , "4: ssh"
                  , "5: doc"
                  , "6: irc"
                  , "7: mus"
                  , "8: ply"
                  , "9: mis"
                  ]

------------------------------------------------------------------------
-- Borders
--

bWidth        = 2
bColor        = C.foreground
bFocusedColor = C.primary

------------------------------------------------------------------------
-- Central Configuration
-- 

main = do
    -- barProc <- spawnPipe "netcat localhost 6868" -- DEBUG ONLY
    barProc <- spawnPipe "xmobar ~/.config/xmobar/xmobar.hs"

    xmonad $ ewmh $ docks def {
        startupHook        = spawnOnce "~/.xmonad/scripts/startup.sh",
        manageHook         = R.windowRules,

        modMask            = K.modifier,

        workspaces         = myWorkspaces,
        layoutHook         = L.layouts 10,

        focusFollowsMouse  = True,
        clickJustFocuses   = False,

        borderWidth        = bWidth,
        normalBorderColor  = bColor,
        focusedBorderColor = bFocusedColor,

        logHook            = B.xmobarInteraction barProc
    } `additionalKeysP` K.keybinds myWorkspaces
