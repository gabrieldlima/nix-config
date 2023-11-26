-- ╔══════════════════════════════════════════════════════╗
-- ║██╗  ██╗███╗   ███╗ ██████╗ ███╗   ██╗ █████╗ ██████╗ ║
-- ║╚██╗██╔╝████╗ ████║██╔═══██╗████╗  ██║██╔══██╗██╔══██╗║
-- ║ ╚███╔╝ ██╔████╔██║██║   ██║██╔██╗ ██║███████║██║  ██║║
-- ║ ██╔██╗ ██║╚██╔╝██║██║   ██║██║╚██╗██║██╔══██║██║  ██║║
-- ║██╔╝ ██╗██║ ╚═╝ ██║╚██████╔╝██║ ╚████║██║  ██║██████╔╝║
-- ║╚═╝  ╚═╝╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝  ╚═╝╚═════╝ ║
-- ╚══════════════════════════════════════════════════════╝

import XMonad                     -- Core XMonad module

import XMonad.Hooks.EwmhDesktops  -- Enhances XMonad's handling of EWMH hints and full-screen support
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP

import XMonad.Layout.ThreeColumns -- Layout for arranging windows in three columns

import XMonad.Util.EZConfig       -- Utility for easily configuring keybindings
import XMonad.Util.Ungrab         -- Handles releasing keyboard and pointer grabs
import XMonad.Util.Loggers

main :: IO ()
main = xmonad
     . ewmhFullscreen
     . ewmh
     . withEasySB (statusBarProp "xmobar" (pure myXmobarPP)) toggleStrutsKey
     $ myConfig
  where
    toggleStrutsKey :: XConfig Layout -> (KeyMask, KeySym)
    toggleStrutsKey XConfig{ modMask = m } = (m, xK_s)

myConfig = def
    {
      modMask = mod4Mask    -- Rebind Mod to the Super Key
    , layoutHook = myLayout -- Use custom layouts
    }
  `additionalKeysP`
    [
      ("M-b",        spawn "qutebrowser")     -- Browser
    , ("M-p",        spawn "rofi -show drun") -- Launcher
    , ("M-<Return>", spawn "wezterm")         -- Terminal
    , ("M-C-s",      spawn "scrot -s")        -- Screenshot
    ]

myLayout = tiled ||| Mirror tiled ||| threeCol ||| Full
  where
    threeCol = ThreeColMid nmaster delta ratio
    tiled   = Tall nmaster delta ratio
    nmaster = 1     -- Default number of windows in the master pane
    ratio   = 1/2   -- Default proportion of screen occupied by master pane
    delta   = 3/100 -- Percent of screen to increment by when resizing panes

myXmobarPP :: PP
myXmobarPP = def
    {
      ppCurrent         = peach . wrap "[" "]"                 -- how to print the tag of the currently focused workspace
    , ppHidden          = green . wrap "" ""                   -- how to print tags of hidden workspaces which contain windows
    , ppUrgent          = red . wrap (yellow "!") (yellow "!") -- format to be applied to tags of urgent workspaces
    , ppSep             = red " \xf0e7 "                       -- separator to use between different log sections
    , ppTitle           = text . shorten 100                   -- window title format for the focused window
    , ppTitleSanitize   = xmobarStrip                          -- escape / sanitizes input to ppTitle
    }
  where
    rosewater, flamingo, pink, mauve, red, marron, peach, yellow, green, teal, sky, sapphire, blue, lavender, text, base, surface2 :: String -> String
    rosewater = xmobarColor "#f5e0dc" ""
    flamingo  = xmobarColor "#f2cdcd" ""
    pink      = xmobarColor "#f5c2e7" ""
    mauve     = xmobarColor "#cba6f7" ""
    red       = xmobarColor "#f38ba8" ""
    marron    = xmobarColor "#eba0ac" ""
    peach     = xmobarColor "#fab387" ""
    yellow    = xmobarColor "#f9e2af" ""
    green     = xmobarColor "#a6e3a1" ""
    teal      = xmobarColor "#94e2d5" ""
    sky       = xmobarColor "#89dceb" ""
    sapphire  = xmobarColor "#74c7ec" ""
    blue      = xmobarColor "#89b4fa" ""
    lavender  = xmobarColor "#b4befe" ""
    text      = xmobarColor "#cdd6f4" ""
    base      = xmobarColor "#050508" ""
    surface2  = xmobarColor "#585b70" ""