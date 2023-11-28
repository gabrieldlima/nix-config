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
import XMonad.Hooks.StatusBar     -- Composable and dynamic status bars
import XMonad.Hooks.StatusBar.PP  -- The pretty-printing abstraction for handling status bars
import XMonad.Hooks.ManageHelpers -- Provides helper functions to be used in manageHook

import XMonad.Layout.ThreeColumns -- Layout for arranging windows in three columns
import XMonad.Layout.Spacing      -- Add a configurable amount of space around windows
import XMonad.Layout.Renamed      -- Modify the description of a layout in a flexible way

import XMonad.ManageHook          -- An EDSL for ManageHooks

import XMonad.Util.EZConfig       -- Utility for easily configuring keybindings
import XMonad.Util.Ungrab         -- Handles releasing keyboard and pointer grabs
import XMonad.Util.Loggers
import XMonad.Util.SpawnOnce      -- A module for spawning a command once, and only once

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
      modMask = mod4Mask          -- Rebind Mod to the Super Key
    , layoutHook = myLayout       -- Use custom layouts
    , startupHook = myStartupHook -- Autostart applications
    , manageHook = myManageHook   -- Match on certain windows
    , borderWidth = myBorderWidth
    , normalBorderColor = myNormalBorderColor
    , focusedBorderColor = myFocusedBorderColor
    }
  `additionalKeysP`
    [
      ("M-b",        spawn "qutebrowser")     -- Browser
    , ("M-p",        spawn "rofi -show drun") -- Launcher
    , ("M-<Return>", spawn "wezterm")         -- Terminal
    , ("M-C-s",      spawn "scrot -s")        -- Screenshot
    ]

myLayout = renamed [CutWordsLeft 1] $ spacingRaw False (Border 5 5 5 5) True (Border 5 5 5 5) True
    $ tiled ||| Mirror tiled ||| threeCol ||| Full
  where
    threeCol = ThreeColMid nmaster delta ratio
    tiled   = Tall nmaster delta ratio
    nmaster = 1     -- Default number of windows in the master pane
    ratio   = 1/2   -- Default proportion of screen occupied by master pane
    delta   = 3/100 -- Percent of screen to increment by when resizing panes

myManageHook :: ManageHook
myManageHook = composeAll
    [
      isDialog --> doFloat
      -- className =? "WM_CLASS(STRING)" --> doFloat
    ]

myStartupHook :: X ()
myStartupHook = do
  spawnOnce "picom"                          -- Compositor
  spawnOnce "nitrogen --restore"             -- Set a nice wallpaper
  spawnOnce "xsetroot -cursor_name left_ptr" -- Set the default X cursor to the usual pointer
  spawnOnce "xset s off -dpms"               -- Disable screen saver
  spawnOnce "openrgb -d 0 -m off"            -- Turn off DIMM01 RGB leds
  spawnOnce "openrgb -d 1 -m off"            -- Turn off DIMM02 RGB leds

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

myBorderWidth = 1
myNormalBorderColor = "#050508"
myFocusedBorderColor = "#fab387"
