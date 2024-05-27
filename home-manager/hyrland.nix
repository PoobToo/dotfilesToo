{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;
    #current hyprland home-manager module doesnt put source file first and i dont feel like fixing that so heres a quick bandaid
    extraConfig =
      ''
        exec-once = /nix/store/rv6z2vams8iy3f13nbp097p1ggm4ngk1-dbus-1.14.10/bin/dbus-update-activation-environment --systemd DISPLAY HYPRLAND_INSTANCE_SIGNATURE WAYLAND_DISPLAY XDG_CURRENT_DESKTOP && systemctl --user stop hyprland-session.target && systemctl --user start hyprland-session.target
        source = ~/.cache/wal/hyprland.conf
        animations {
          bezier=myBezier,0.05,0.9,0.1,1.05
          animation=windows, 1, 7, myBezier, slide
          animation=windowsOut, 1, 7, myBezier, slide
          animation=border, 1, 10, default
          animation=borderangle, 1, 8, default
          animation=fadeIn, 0, 30, default
          animation=fadeOut, 1, 10, default
          animation=workspaces, 1, 6, default
          enabled=yes
        }

        decoration {
          blur {
            brightness=0.800000
            contrast=0.900000
            enabled=true
            new_optimizations=on
            noise=0.010000
            passes=3
            size=8
          }
          col.shadow=rgba(00000044)
          dim_inactive=false
          drop_shadow=no
          rounding=10
          shadow_range=8
          shadow_render_power=2
        }

        general {
          col.active_border=rgb($color3)
          col.inactive_border=rgb($background)
          layout=dwindle
          border_size=3
          gaps_out=10
        }

        gestures {
          workspace_swipe=true
        }

        input {
          touchpad {
            disable_while_typing=true
            drag_lock=true
            natural_scroll=yes
          }
          float_switch_override_focus=2
          follow_mouse=1
          kb_layout=us
          sensitivity=0
        }

        misc {
          disable_splash_rendering=true
        }
        bind=SUPER, return, exec, foot
        bind=SUPER, Q, killactive
        bind=SUPER, M, exit
        bind=SUPER, V, togglefloating
        bind=SUPER, F, fullscreen
        bind=SUPER, mouse_down, workspace, e-1
        bind=SUPER, mouse_up, workspace, e+1
        bind=SUPER, 1, workspace, 1
        bind=SUPER, 2, workspace, 2
        bind=SUPER, 3, workspace, 3
        bind=SUPER, 4, workspace, 4
        bind=SUPER, 5, workspace, 5
        bind=SUPER, 6, workspace, 6
        bind=SUPER, 7, workspace, 7
        bind=SUPER, 8, workspace, 8
        bind=SUPER, 9, workspace, 9
        bind=SUPER SHIFT, 1, movetoworkspace, 1
        bind=SUPER SHIFT, 2, movetoworkspace, 2
        bind=SUPER SHIFT, 3, movetoworkspace, 3
        bind=SUPER SHIFT, 4, movetoworkspace, 4
        bind=SUPER SHIFT, 5, movetoworkspace, 5
        bind=SUPER SHIFT, 6, movetoworkspace, 6
        bind=SUPER SHIFT, 7, movetoworkspace, 7
        bind=SUPER SHIFT, 8, movetoworkspace, 8
        bind=SUPER SHIFT, 9, movetoworkspace, 9
        bindm=SUPER, mouse:272, movewindow
        bindm=SUPER, mouse:273, resizewindow
        monitor=,prefferred,auto,1.1
      '';

    #    settings = {
    #      exec-once = [
    #
    #      ];
    #
    #      monitor = ",prefferred,auto,1.1";
    #
    #      general = {
    #        layout = "dwindle";
    #        "col.active_border" = "rgb($background)";
    #      };
    #
    #      misc = {
    #        disable_splash_rendering = true;
    #      };
    #
    #      input = {
    #        kb_layout = "us";
    #        follow_mouse = 1;
    #        touchpad = {
    #          natural_scroll = "yes";
    #          disable_while_typing = true;
    #          drag_lock = true;
    #        };
    #        sensitivity = 0;
    #        float_switch_override_focus = 2;
    #      };
    #
    #      gestures = {
    #        workspace_swipe = true;
    #      };
    #
    #      # Regular bindings
    #      bind =
    #        let
    #          binding = mod: cmd: key: arg: "${mod}, ${key}, ${cmd}, ${arg}";
    #          ws = binding "SUPER" "workspace";
    #          mvtows = binding "SUPER SHIFT" "movetoworkspace";
    #          arr = [ 1 2 3 4 5 6 7 8 9 ];
    #        in
    #        [
    #          "SUPER, return, exec, foot"
    #          "SUPER, Q, killactive"
    #          "SUPER, M, exit"
    #          "SUPER, V, togglefloating"
    #          "SUPER, F, fullscreen"
    #          #workspace change with scroll
    #          "SUPER, mouse_down, workspace, e-1"
    #          "SUPER, mouse_up, workspace, e+1"
    #        ]
    #        # map workspace switch and movetoworkspace over array of 1-9, courtesy of @Alyur
    #        ++ (map (i: ws (toString i) (toString i)) arr)
    #        ++ (map (i: mvtows (toString i) (toString i)) arr);
    #
    #      bindm = [
    #        "SUPER, mouse:272, movewindow"
    #        "SUPER, mouse:273, resizewindow"
    #      ];
    #
    #      decoration = {
    #        drop_shadow = "yes";
    #        shadow_range = 8;
    #        shadow_render_power = 2;
    #        rounding = 10;
    #        "col.shadow" = "rgba(00000044)";
    #
    #
    #        dim_inactive = false;
    #
    #        blur = {
    #          enabled = true;
    #          size = 8;
    #          passes = 3;
    #          new_optimizations = "on";
    #          noise = 0.01;
    #          contrast = 0.9;
    #          brightness = 0.8;
    #        };
    #      };
    #
    #      animations = {
    #        enabled = "yes";
    #        bezier = "myBezier,0.05,0.9,0.1,1.05";
    #        animation = [
    #          "windows, 1, 7, myBezier, slide"
    #          "windowsOut, 1, 7, myBezier, slide"
    #          "border, 1, 10, default"
    #          "borderangle, 1, 8, default"
    #          "fadeIn, 0, 30, default"
    #          "fadeOut, 1, 10, default"
    #          "workspaces, 1, 6, default"
    #        ];
    # };
    # };
  };
}
