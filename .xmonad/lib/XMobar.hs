module XMobar where

import XMonad.Util.Run
import XMonad.Hooks.DynamicLog

import qualified Colors as C

separator            = "<fc=" ++ C.distinctor ++ ">   ||   </fc>"
layout           str = "<fc=" ++ C.highlight_tertiary ++ ">" ++ str ++ "</fc>"
title            str = "<fc=" ++ C.highlight_quaternary ++ ">" ++ str ++ "</fc>"

workspace        str = "  <fc=" ++ C.highlight_secondary ++ ">" ++ str ++ "</fc>"
activeWorkspace  str = "  <fc=" ++ C.highlight_primary ++ ">" ++ str ++ "</fc>"
currentWorkspace str = "  <fc=" ++ C.highlight_primary ++ ">[ " ++ str ++ " ]</fc>"

xmobarInteraction bar = dynamicLogWithPP $ xmobarPP
    { ppSep             = separator
    , ppLayout          = layout
    , ppTitle           = title . shorten 65

    , ppHiddenNoWindows = workspace
    , ppHidden          = activeWorkspace
    , ppVisible         = activeWorkspace
    , ppCurrent         = currentWorkspace

--    , ppHiddenNoWindows = wrap "  <fc=#81a1c1>" "</fc>"                        -- Not being used.
--    , ppHidden          = wrap "  <fc=#8fbcbb>" "</fc>"                        -- Being used.
--    , ppVisible         = wrap "  <fc=#8fbcbb>" "</fc>"                        -- Being used.
--    , ppCurrent         = wrap "  <fc=#8fbcbb>[ " " ]</fc>"                    -- Current.
--    , ppUrgent          = wrap "  <fc=#bf616a>" "</fc>"                        -- Urgent.

    , ppOrder           = \(ws:l:t:ex) -> [ws,l]++ex++[t]
    , ppOutput          = \x -> hPutStrLn bar x
    }
