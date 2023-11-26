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

main :: IO ()
main = xmonad
     . ewmhFullscreen
     . ewmh
     . withEasySB (statusBarProp "xmobar" (pure def)) toggleStrutsKey
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
