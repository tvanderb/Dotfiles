module WindowRules where

import XMonad
import XMonad.Hooks.ManageHelpers
import XMonad.Actions.CopyWindow

windowRules = composeAll
    [ className =? "MPlayer"        --> doFloat
    , className =? "Gimp"           --> doFloat
    , className =? "desktop_window" --> doIgnore
    , className =? "kdesktop"       --> doIgnore
    , className =? "Firefox" <&&> resource =? "Toolkit" --> doFloat
    , title =? "Picture-in-Picture" --> doF copyToAll
    , title =? "Picture-in-Picture" --> doFloat
    ]
