import XMonad
import XMonad.Hooks.ManageDocks
import XMonad.Config.Gnome
import qualified XMonad.StackSet as W   -- Managehook rules, for unfloat
import XMonad.Util.EZConfig

myManageHook = composeAll
   [ className =? "Slack"                               --> doShift "9:slack"
   , className =? "Google-chrome" <&&> title =? "LINE"  --> doShift "8:line"
   , className =? "Google-chrome" --> doShift "2:web"
   , manageDocks
   ]

-- main = xmonad $ gnomeConfig
main = xmonad $ gnomeConfig
    { borderWidth = 3
    , workspaces = ["1:dev","2:web","3","4","5","6","7","8:line","9:slack"]
    , modMask = mod4Mask
    , terminal = "urxvt"
    , manageHook = manageDocks <+> myManageHook <+> manageHook defaultConfig
    }
