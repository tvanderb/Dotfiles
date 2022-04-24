module Colors where
 
------------------------------------------------------------------------
-- Dynamic Variables
--
-- These values (and names) can change by theme, and, probably will. J-
-- ust make sure to change them in the "Important Variables" section.
--

night_0  = "#2e3440"
night_1  = "#3b4252"
night_2  = "#434c5e"
night_3  = "#4c566a"

snow_0   = "#d8dee9"
snow_1   = "#e5e9f0"
snow_2   = "#eceff4"

frost_0  = "#8fbcbb"
frost_1  = "#88c0d0"
frost_2  = "#81a1c1"
frost_3  = "#5e81ac"

aurora_0 = "#bf616a"
aurora_1 = "#d08770"
aurora_2 = "#ebcb8b"
aurora_3 = "#a3be8c"
aurora_4 = "#b48ead"

------------------------------------------------------------------------
-- Important Variables (Keep Them)
--

primary                = frost_0

background             = night_0
foreground             = snow_0

highlight_primary      = frost_0
highlight_secondary    = frost_2
highlight_tertiary     = aurora_1
highlight_quaternary   = aurora_3
highlight_quinternary  = aurora_4

distinctor             = night_3

good                   = aurora_3
bad                    = aurora_0
