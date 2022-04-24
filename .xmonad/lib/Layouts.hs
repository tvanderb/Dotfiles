module Layouts where

------------------------------------------------------------------------
-- Imports
--

import XMonad.Hooks.ManageDocks
import XMonad.Layout
import XMonad.Layout.Spacing
import XMonad.Layout.LayoutModifier
import XMonad.Layout.NoBorders
import XMonad.Layout.Renamed
import XMonad.Layout.WindowNavigation
import XMonad.Layout.Spiral
import XMonad.Layout.ThreeColumns
import XMonad.Layout.Grid
import XMonad.Layout.MultiColumns

------------------------------------------------------------------------
-- Spacing
--

gaps :: Integer -> l a -> XMonad.Layout.LayoutModifier.ModifiedLayout Spacing l a
gaps size = spacingRaw False (Border size size size size) True (Border size size size size) True

------------------------------------------------------------------------
-- Layouts
--

tallLayout size        = renamed [Replace "tall"]
                       $ gaps size
                       $ Tall 1 (3/100) (1/2)

wideLayout size        = renamed [Replace "wide"]
                       $ gaps size
                       $ Mirror (Tall 1 (3/100) (1/2))

gridLayout size        = renamed [Replace "grid"]
                       $ gaps size
                       $ Grid

multiColumnLayout size = renamed [Replace "multi-c"]
                       $ gaps size
                       $ multiCol [1] 1 0.01 (-0.5)

threeColumnLayout size = renamed [Replace "three-c"]
                       $ gaps size
                       $ ThreeCol 1 (3/100) (1/2)

fullLayout size        = renamed [Replace "full"]
                       $ gaps size
                       $ Full

spiralLayout size      = renamed [Replace "spiral"]
                       $ gaps size
                       $ spiral (6/7)

layouts size = avoidStruts $ myDefaultLayout
             where
               myDefaultLayout =   tallLayout size
                               ||| wideLayout size
                               ||| fullLayout size
                               ||| gridLayout size
                               ||| multiColumnLayout size
                               ||| threeColumnLayout size
                               ||| spiralLayout size
