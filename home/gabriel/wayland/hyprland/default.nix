{
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland = {
    settings = {
      general = {
        # size of border around windows
        border_size = 2;
        # disable borders for floating windows
        no_border_on_floating = false;
        # gaps between windows
        gaps_in = 5;
        # gaps between windows and monitor edges
        gaps_out = 20;
        # border color for the active window
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        # border color for inactive windows
        "col.inactive_border" = "rgba(595959aa)";
        # in seconds, after how many seconds of cursor’s inactivity to hide it. Set to 0 for never
        cursor_inactive_timeout = 0;
        # which layout to use. (Available: dwindle, master)
        layout = "master";
        # if true, will not warp the cursor in many cases (focusing, keybinds, etc)
        no_cursor_warps = false;
        # if true, will not fall back to the next available window when moving focus in a direction where no window was found
        no_focus_fallback = false;
        # if on, will also apply the sensitivity to raw mouse output (e.g. sensitivity in games) NOTICE: really not recommended
        apply_sens_to_raw = false;
        # enables resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false;
        # extends the area around the border where you can click and drag on, only used when general:resize_on_border is on
        extend_border_grab_area = 15;
        # show a cursor icon when hovering over borders, only used when general:resize_on_border is on
        hover_icon_on_border = true;
        # master switch for allowing tearing to occur
        allow_tearing = false;
      };

      decoration = {
        # rounded corners’ radius (in layout px)
        rounding = 10;
        # opacity of active windows. (0.0 - 1.0)
        active_opacity = 1.0;
        # opacity of inactive windows. (0.0 - 1.0)
        inactive_opacity = 1.0;
        # opacity of fullscreen windows. (0.0 - 1.0)
        fullscreen_opacity = 1.0;
        # enable drop shadows on windows
        drop_shadow = true;
        # Shadow range (“size”) in layout px
        shadow_range = 4;
        # (1 - 4), in what power to render the falloff (more power, the faster the falloff)
        shadow_render_power = 3;
        # if true, the shadow will not be rendered behind the window itself, only around it
        shadow_ignore_window = true;
        # shadow’s color. Alpha dictates shadow’s opacity
        "col.shadow" = "rgba(1a1a1aee)";
        # shadow’s rendering offset.
        shadow_offset = "0, 0";
        # shadow’s scale. 0.0 - 1.0
        shadow_scale = 1.0;
        # enables dimming of inactive windows
        dim_inactive = false;
        # how much inactive windows should be dimmed, 0.0 - 1.0
        dim_strength = 0.5;
        # how much to dim the rest of the screen by when a special workspace is open. 0.0 - 1.0
        dim_special = 0.2;
        # how much the dimaround window rule should dim by. 0.0 - 1.0
        dim_around = 0.4;

        blur = {
          # enable kawase window background blur
          enabled = true;
          # blur size (distance)
          size = 3;
          # the amount of passes to perform
          passes = 1;
          # make the blur layer ignore the opacity of the window
          ignore_opacity = false;
          # whether to enable further optimizations to the blur. Recommended to leave on, as it will massively improve performance
          new_optimizations = true;
          # if enabled, floating windows will ignore tiled windows in their blur. Only available if blur_new_optimizations is true. Will reduce overhead on floating blur significantly
          xray = true;
          # how much noise to apply. 0.0 - 1.0
          noise = 0.0117;
          # contrast modulation for blur. 0.0 - 2.0
          contrast = 0.8916;
          # brightness modulation for blur. 0.0 - 2.0
          brightness = 0.8172;
          # increase saturation of blurred colors. 0.0 - 1.0
          vibrancy = 0;
          # how strong the effect of vibrancy is on dark areas . 0.0 - 1.0
          vibrancy_darkness = 0;
          # whether to blur behind the special workspace (note: expensive)
          special = false;
        };
      };

      animations = {
        # enable animations
        enabled = true;
        # enable first launch animation
        first_launch_animation = true;
        # Defining your own Bezier curve can be done with the bezier keyword
        # - https://www.cssportal.com/css-cubic-bezier-generator/
        # - https://easings.net/
        bezier = [
          "easein,0.11, 0, 0.5, 0"
          "easeout,0.5, 1, 0.89, 1"
          "easeinback,0.36, 0, 0.66, -0.56"
          "easeoutback,0.34, 1.56, 0.64, 1"
        ];
        # Animations are declared with the animation keyword
        # animation = NAME, ONOFF, SPEED, CURVE, STYLE
        # - NAME:
            # ↳ global
                # ↳ windows - styles: slide, popin
                    # ↳ windowsIn - window open
                    # ↳ windowsOut - window close
                    # ↳ windowsMove - everything in between, moving, dragging, resizing.
            # ↳ fade
                # ↳ fadeIn - fade in (open) -> layers and windows
                # ↳ fadeOut - fade out (close) -> layers and windows
                # ↳ fadeSwitch - fade on changing activewindow and its opacity
                # ↳ fadeShadow - fade on changing activewindow for shadows
                # ↳ fadeDim - the easing of the dimming of inactive windows
            # ↳ border - for animating the border's color switch speed
            # ↳ borderangle - for animating the border's gradient angle - styles: once (default), loop
            # ↳ workspaces - styles: slide, slidevert, fade, slidefade, slidefadevert
            # ↳ specialWorkspace - styles: same as workspaces
        # - ONOFF: can be either 0 or 1, 0 to disable, 1 to enable. note: if it’s 0, you can omit further args.
        # - SPEED: is the amount of ds (1ds = 100ms) the animation will take
        # - CURVE: is the bezier curve name
        # - STYLE: (optional) is the animation style
        animation = [
          "windowsIn,1,3,easeoutback,slide"
          "windowsOut,1,3,easeinback,slide"
          "windowsMove,1,3,easeoutback"
          "workspaces,1,2,easeoutback,slide"
          "fadeIn,1,3,easeout"
          "fadeOut,1,3,easein"
          "fadeSwitch,1,3,easeout"
          "fadeShadow,1,3,easeout"
          "fadeDim,1,3,easeout"
          "border,1,3,easeout"
        ];
      };

      input = {
        # Appropriate XKB keymap parameter
        kb_layout = "us";
        # Engage numlock by default.
        numlock_by_default = false;
        # The repeat rate for held-down keys, in repeats per seconds
        repeat_rate = 25;
        # Delay before a held-down key is repeated, in milliseconds
        repeat_delay = 600;
        # Sets the mouse input sensitivity. Value will be clamped to the range -1.0 to 1.0
        sensitivity = 0;
        # Force no cursor acceleration. This bypasses most of your pointer settings to get as raw of a signal as possible. Enabling this is not recommended due to potential cursor desynchronization
        force_no_accel = false;
        # Switches RMB and LMB
        left_handed = false;
        # Sets the scroll button. Has to be an int, cannot be a string. Check wev if you have any doubts regarding the ID. 0 means default
        scroll_button = 0;
        # If the scroll button lock is enabled, the button does not need to be held down. Pressing and releasing the button once enables the button lock, the button is now considered logically held down. Pressing and releasing the button a second time logically releases the button. While the button is logically held down, motion events are converted to scroll events
        scroll_button_lock = false;
        # Inverts scrolling direction. When enabled, scrolling moves content directly instead of manipulating a scrollbar
        natural_scroll = false;
        # (0/1/2/3) Specify if and how cursor movement should affect window focus. See the note below
        # - 0: Cursor movement will not change focus.
        # - 1: Cursor movement will always change focus to the window under the cursor.
        # - 2: Cursor focus will be detached from keyboard focus. Clicking on a window will move keyboard focus to that window.
        # - 3: Cursor focus will be completely separate from keyboard focus. Clicking on a window will not change keyboard focus.
        follow_mouse = 1;
        # If disabled and follow_mouse=1 then mouse focus will not switch to the hovered window unless the mouse crosses a window boundary
        mouse_refocus = true;
        # If enabled (1 or 2), focus will change to the window under the cursor when changing from tiled-to-floating and vice versa. If 2, focus will also follow mouse on float-to-float switches
        float_switch_override_focus = 1;
      };
    };

    extraConfig = ''
      #
      # Refer to the wiki for more information.

      #
      # Please note not all available settings / options are set here.
      # For a full list, see the wiki
      #

      # See https://wiki.hyprland.org/Configuring/Monitors/
      monitor=,preferred,auto,auto


      # See https://wiki.hyprland.org/Configuring/Keywords/ for more

      # Execute your favorite apps at launch
      # exec-once = waybar & hyprpaper & firefox

      # Source a file (multi-file configs)
      # source = ~/.config/hypr/myColors.conf

      # Set programs that you use
      $terminal = wezterm
      $fileManager = dolphin
      $menu = wofi --show drun
      # Some default env vars.
      env = XCURSOR_SIZE,24

      # For all categories, see https://wiki.hyprland.org/Configuring/Variables/

      dwindle {
          # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
          pseudotile = true # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
          preserve_split = true # you probably want this
      }

      master {
          # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
          new_is_master = true
      }

      gestures {
          # See https://wiki.hyprland.org/Configuring/Variables/ for more
          workspace_swipe = false
      }

      misc {
          # See https://wiki.hyprland.org/Configuring/Variables/ for more
          force_default_wallpaper = -1 # Set to 0 to disable the anime mascot wallpapers
      }

      # Example per-device config
      # See https://wiki.hyprland.org/Configuring/Keywords/#per-device-input-configs for more
      device:epic-mouse-v1 {
          sensitivity = -0.5
      }

      # Example windowrule v1
      # windowrule = float, ^(kitty)$
      # Example windowrule v2
      # windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
      # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
      windowrulev2 = nomaximizerequest, class:.* # You'll probably like this.


      # See https://wiki.hyprland.org/Configuring/Keywords/ for more
      $mainMod = SUPER

      # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
      bind = $mainMod, Q, exec, $terminal
      bind = $mainMod, C, killactive,
      bind = $mainMod, M, exit,
      bind = $mainMod, E, exec, $fileManager
      bind = $mainMod, V, togglefloating,
      bind = $mainMod, R, exec, $menu
      bind = $mainMod, P, pseudo, # dwindle
      bind = $mainMod, J, togglesplit, # dwindle

      # Move focus with mainMod + arrow keys
      bind = $mainMod, left, movefocus, l
      bind = $mainMod, right, movefocus, r
      bind = $mainMod, up, movefocus, u
      bind = $mainMod, down, movefocus, d

      # Switch workspaces with mainMod + [0-9]
      bind = $mainMod, 1, workspace, 1
      bind = $mainMod, 2, workspace, 2
      bind = $mainMod, 3, workspace, 3
      bind = $mainMod, 4, workspace, 4
      bind = $mainMod, 5, workspace, 5
      bind = $mainMod, 6, workspace, 6
      bind = $mainMod, 7, workspace, 7
      bind = $mainMod, 8, workspace, 8
      bind = $mainMod, 9, workspace, 9
      bind = $mainMod, 0, workspace, 10

      # Move active window to a workspace with mainMod + SHIFT + [0-9]
      bind = $mainMod SHIFT, 1, movetoworkspace, 1
      bind = $mainMod SHIFT, 2, movetoworkspace, 2
      bind = $mainMod SHIFT, 3, movetoworkspace, 3
      bind = $mainMod SHIFT, 4, movetoworkspace, 4
      bind = $mainMod SHIFT, 5, movetoworkspace, 5
      bind = $mainMod SHIFT, 6, movetoworkspace, 6
      bind = $mainMod SHIFT, 7, movetoworkspace, 7
      bind = $mainMod SHIFT, 8, movetoworkspace, 8
      bind = $mainMod SHIFT, 9, movetoworkspace, 9
      bind = $mainMod SHIFT, 0, movetoworkspace, 10

      # Example special workspace (scratchpad)
      bind = $mainMod, S, togglespecialworkspace, magic
      bind = $mainMod SHIFT, S, movetoworkspace, special:magic

      # Scroll through existing workspaces with mainMod + scroll
      bind = $mainMod, mouse_down, workspace, e+1
      bind = $mainMod, mouse_up, workspace, e-1

      # Move/resize windows with mainMod + LMB/RMB and dragging
      bindm = $mainMod, mouse:272, movewindow
      bindm = $mainMod, mouse:273, resizewindow
    '';
  };
}
