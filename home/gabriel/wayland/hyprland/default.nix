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
      input {
          kb_layout = us
          kb_variant =
          kb_model =
          kb_options =
          kb_rules =

          follow_mouse = 1

          touchpad {
              natural_scroll = false
          }

          sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
      }

      animations {
          enabled = true

          # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

          bezier = myBezier, 0.05, 0.9, 0.1, 1.05

          animation = windows, 1, 7, myBezier
          animation = windowsOut, 1, 7, default, popin 80%
          animation = border, 1, 10, default
          animation = borderangle, 1, 8, default
          animation = fade, 1, 7, default
          animation = workspaces, 1, 6, default
      }

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
