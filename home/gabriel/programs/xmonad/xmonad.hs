-- ╔══════════════════════════════════════════════════════╗
-- ║██╗  ██╗███╗   ███╗ ██████╗ ███╗   ██╗ █████╗ ██████╗ ║
-- ║╚██╗██╔╝████╗ ████║██╔═══██╗████╗  ██║██╔══██╗██╔══██╗║
-- ║ ╚███╔╝ ██╔████╔██║██║   ██║██╔██╗ ██║███████║██║  ██║║
-- ║ ██╔██╗ ██║╚██╔╝██║██║   ██║██║╚██╗██║██╔══██║██║  ██║║
-- ║██╔╝ ██╗██║ ╚═╝ ██║╚██████╔╝██║ ╚████║██║  ██║██████╔╝║
-- ║╚═╝  ╚═╝╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝  ╚═╝╚═════╝ ║
-- ╚══════════════════════════════════════════════════════╝

--
-- Useful imports
--
import XMonad                     -- Core XMonad module

import XMonad.Hooks.EwmhDesktops  -- Enhances XMonad's handling of EWMH hints and full-screen support
import XMonad.Hooks.DynamicLog    -- Send information about xmonad's state to an X11 property or standard output
import XMonad.Hooks.StatusBar     -- Composable and dynamic status bars
import XMonad.Hooks.StatusBar.PP  -- The pretty-printing abstraction for handling status bars
import XMonad.Hooks.ManageHelpers -- Provides helper functions to be used in manageHook

import XMonad.Layout.ThreeColumns -- Layout for arranging windows in three columns
import XMonad.Layout.Spacing      -- Add a configurable amount of space around windows
import XMonad.Layout.Renamed      -- Modify the description of a layout in a flexible way
import XMonad.Layout.NoBorders    -- Make a given layout display without borders

import XMonad.ManageHook          -- An EDSL for ManageHooks

import XMonad.Util.EZConfig       -- Utility for easily configuring keybindings
import XMonad.Util.Ungrab         -- Handles releasing keyboard and pointer grabs
import XMonad.Util.SpawnOnce      -- A module for spawning a command once, and only once

-------------------------------------------------------------------------------
-- The default number of workspaces (virtual screens) and their names.
-- By default we use numeric strings, but any string may be used as a
-- workspace name. The number of workspaces is determined by the length
-- of this list.
--
-- A tagging example:
--
-- > workspaces = ["web", "irc", "code" ] ++ map show [4..9]
--
workspaces :: [WorkspaceId]
workspaces = map show [1 .. 9 :: Int]

-- modMask lets you specify which modkey you want to use. The default
-- is mod1Mask ("left alt").  You may also consider using mod3Mask
-- ("right alt"), which does not conflict with emacs keybindings. The
-- "windows key" is usually mod4Mask.
--
myModMask :: KeyMask
myModMask = mod4Mask

-- Width of the window border in pixels.
--
myBorderWidth :: Dimension
myBorderWidth = 1

-- Border colors for unfocused and focused windows, respectively.
--
myNormalBorderColor, myFocusedBorderColor :: String
myNormalBorderColor  = "#050508"
myFocusedBorderColor = "#fab387"

-- Whether focus follows the mouse pointer.
--
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

-- Whether a mouse click select the focus or is just passed to the window
--
myClickJustFocuses :: Bool
myClickJustFocuses = True

-------------------------------------------------------------------------------
-- Window rules

-- Execute arbitrary actions and WindowSet manipulations when managing
-- a new window. You can use this to, for example, always float a
-- particular program, or have a client always appear on a particular
-- workspace.
--
-- To find the property name associated with a program, use
--  xprop | grep WM_CLASS
-- and click on the client you're interested in.
myManageHook :: ManageHook
myManageHook = composeAll
    [
      isDialog --> doFloat
    ]

-------------------------------------------------------------------------------
-- Key bindings:

myTerminal :: String
myTerminal = "wezterm"

myBrowser :: String
myBrowser = "qutebrowser"

myLauncher :: String
myLauncher = "rofi -show drun"

myScreenshot :: String
myScreenshot = "scrot -s"

myKeys =
    [
      ("M-b",        spawn myBrowser)    -- Launch browser
    , ("M-p",        spawn myLauncher)   -- Launch rofi launcher
    , ("M-<Return>", spawn myTerminal)   -- Launch terminal
    , ("M-C-s",      spawn myScreenshot) -- Launch scrot
    ]

-------------------------------------------------------------------------------
myStartupHook :: X ()
myStartupHook = do
    spawnOnce "picom"                          -- Compositor
    spawnOnce "nitrogen --restore"             -- Set a nice wallpaper
    spawnOnce "xsetroot -cursor_name left_ptr" -- Set the default X cursor to the usual pointer
    spawnOnce "xset s off -dpms"               -- Disable screen saver
    spawnOnce "openrgb -d 0 -m off"            -- Turn off DIMM01 RGB leds
    spawnOnce "openrgb -d 1 -m off"            -- Turn off DIMM02 RGB leds

-------------------------------------------------------------------------------
myLayoutHook = renamed [CutWordsLeft 1] $ spacingRaw False (Border 5 5 5 5) True (Border 5 5 5 5) True
    $ smartBorders $ tiled ||| Mirror tiled ||| threeCol ||| Full
  where
    threeCol = ThreeColMid nmaster delta ratio
    tiled   = Tall nmaster delta ratio
    nmaster = 1     -- Default number of windows in the master pane
    ratio   = 1/2   -- Default proportion of screen occupied by master pane
    delta   = 3/100 -- Percent of screen to increment by when resizing panes

-------------------------------------------------------------------------------
myConfig = def
    {
      modMask            = myModMask             -- Rebind Mod to the Super Key
    , layoutHook         = myLayoutHook          -- Use custom layouts
    , startupHook        = myStartupHook         -- Autostart applications
    , manageHook         = myManageHook          -- Match on certain windows
    , borderWidth        = myBorderWidth         -- Border width
    , normalBorderColor  = myNormalBorderColor   -- Normal border color
    , focusedBorderColor = myFocusedBorderColor  -- Focused border color
    , focusFollowsMouse  = myFocusFollowsMouse
    , clickJustFocuses   = myClickJustFocuses
    }
  `additionalKeysP` myKeys

-------------------------------------------------------------------------------
main :: IO ()
main = xmonad
     . ewmhFullscreen
     . ewmh
     $ myConfig
