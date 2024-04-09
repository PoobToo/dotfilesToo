{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      exec-once = [

      ];

      monitor = ",prefferred,auto,1.1";

      general = {
        layout = "dwindle";
      };

      misc = {
        disable_splash_rendering = true;
      };

      input = {
        kb_layout = "us";
        follow_mouse = 1;
        touchpad = {
          natural_scroll = "yes";
          disable_while_typing = true;
          drag_lock = true;
        };
        sensitivity = 0;
        float_switch_override_focus = 2;
      };

      gestures = {
        workspace_swipe = true;
      };

      # Regular bindings
      bind =
        let
          binding = mod: cmd: key: arg: "${mod}, ${key}, ${cmd}, ${arg}";
          ws = binding "SUPER" "workspace";
          mvtows = binding "SUPER SHIFT" "movetoworkspace";
          arr = [ 1 2 3 4 5 6 7 8 9 ];
        in
        [
          "SUPER, return, exec, foot"
          "SUPER, Q, killactive"
          "SUPER, M, exit"
          "SUPER, V, togglefloating"
          "SUPER, F, fullscreen"
          #workspace change with scroll
          "SUPER, mouse_down, workspace, e-1"
          "SUPER, mouse_up, workspace, e+1"
        ]
        # map workspace switch and movetoworkspace over array of 1-9, courtesy of @Alyur
        ++ (map (i: ws (toString i) (toString i)) arr)
        ++ (map (i: mvtows (toString i) (toString i)) arr);

      bindm = [
        "SUPER, mouse:272, movewindow"
        "SUPER, mouse:273, resizewindow"
      ];

      decoration = {
        drop_shadow = "yes";
        shadow_range = 8;
        shadow_render_power = 2;
        rounding = 10;
        "col.shadow" = "rgba(00000044)";

        dim_inactive = false;

        blur = {
          enabled = true;
          size = 8;
          passes = 3;
          new_optimizations = "on";
          noise = 0.01;
          contrast = 0.9;
          brightness = 0.8;
        };
      };

      animations = {
        enabled = "yes";
        bezier = "myBezier,0.05,0.9,0.1,1.05";
        animation = [
          "windows, 1, 7, myBezier, slide"
          "windowsOut, 1, 7, myBezier, slide"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fadeIn, 0, 30, default"
          "fadeOut, 1, 10, default"
          "workspaces, 1, 6, default"
        ];
      };
    };
  };

}
