import XMonad
import XMonad.Hooks.ManageDocks
import XMonad.Config.Gnome

main = xmonad $ gnomeConfig
    { borderWidth = 3
    , modMask = mod4Mask
    }
