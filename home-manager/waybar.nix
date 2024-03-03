{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    style = ./style.css;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        spacing = 0;
        margin-bottom = 0;
        margin-top = 0;
        modules-left = [ "clock" "hyprland/window" ];
        modules-center = [ "hyprland/workspaces" ];
        modules-right = [ "mpris" "cava" "wireplumber" "backlight" "cpu" "memory" "temperature" "bluetooth" "network" "custom/power" ];
        exclusive = true;
      };

      "hyprland/workspaces" = {
        on-click = "activate";
        sort-by-number = true;
      };

      "hyprland/window" = {
        max-length = 30;
        rewrite = {
          "(.*) — LibreWolf" = "󰈹 ";
          LibreWolf = "󰈹 ";
        };
      };
      clock = {
        format = "{:%H:%M} time ";
        format-alt = "{:%A, %B %d, %Y (%R)} ";
        tooltip = false;
        actions = {
          on-click-right = "mode";
          on-click-forward = "tz_up";
          on-click-backward = "tz_down";
          on-scroll-up = "shift_up";
          on-scroll-down = "shift_down";
        };
      };

      "custom/power" = {
        format = "";
        on-click = "wlogout";
        tooltip = false;
      };

      network = {
        interface = "wlp1s0";
        format-wifi = "{icon}";
        format-icons = [ "󰤟" "󰤢" "󰤥" "󰤨" ];
        format-ethernet = "󰈁";
        format-disconnected = "";
        tooltip = false;
      };

      bluetooth = {
        controller = "radish";
        format = "";
        format-disabled = "";
        format-off = "";
        format-connected = " {num_connections}";
        tooltip-format = "{controller_alias}\t{controller_address}";
        tooltip-format-connected = "{device_enumerate}";
        tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
      };

      temperature = {
        format = "{temperatureC}°C ";
      };

      memory = {
        format = "{percentage}%   ";
        tooltip = false;
      };

      cpu = {
        format = "{usage}%   ";
        tooltip = false;
      };

      backlight = {
        device = "intel_backlight";
        format = "{percent}% {icon}";
        format-icons = [ "󰃞" "󰃟" "󰃠" ];
      };

      wireplumber = {
        format = "{volume}% {icon}";
        format-muted = "";
        on-click = "qjackctl";
        format-icons = [ "" "" "" ];
        tooltip = false;
      };

      cava = {
        cava_config = "/home/leo/.config/cava/config";
        input_delay = 2;
        format-icons = [ "▁" "▂" "▃" "▄" "▅" "▆" "▇" "█" ];
      };

      mpris = {
        format = "{title} - {artist}";
        ignored-players = [ "firefox" ];
        title-len = 15;
        artist-len = 15;
        interval = 1;
      };
    };
  };
}
