{
  wayland.windowManager.hyprland.settings = {
    binds = {
      # if disabled, will not pass the mouse events to apps / dragging windows around if a keybind has been triggered
      pass_mouse_when_bound = false;
      # in ms, how many ms to wait after a scroll event to allow to pass another one for the binds
      scroll_event_delay = 300;
      # If enabled, an attempt to switch to the currently focused workspace will instead switch to the previous workspace. Akin to i3’s auto_back_and_forth
      workspace_back_and_forth = false;
      # If enabled, workspaces don’t forget their previous workspace, so cycles can be created by switching to the first workspace in a sequence, then endlessly going to the previous workspace
      allow_workspace_cycles = false;
      # Whether switching workspaces should center the cursor on the workspace (0) or on the last active window for that workspace (1)
      workspace_center_on = 0;
      # sets the preferred focus finding method when using focuswindow/movewindow/etc with a direction. 0 - history (recent have priority), 1 - length (longer shared edges have priority)
      focus_preferred_method = 0;
      # If enabled, dispatchers like moveintogroup, moveoutofgroup and movewindoworgroup will ignore lock per group.
      ignore_group_lock = false;
      # If enabled, when on a fullscreen window, movefocus will cycle fullscreen, if not, it will move the focus in a direction
      movefocus_cycles_fullscreen = true;
    };
  };
}
