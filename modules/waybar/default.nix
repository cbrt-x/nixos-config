{ lib, config, ... }:

let
  cfg = config.waybar;
in
{
  options = {
    waybar.enable = lib.mkEnableOption "Enable Waybar";
  };

  config = lib.mkIf cfg.enable {

    home-manager.users.jade.programs = {
      waybar = {
        enable = true;
        systemd.enable = true;
        # TODO why is WAYLAND_DISPLAY unset on graphical-target?
        systemd.target = "hyprland-session.target";
        style = import ./style.nix;
        settings =
          let
            moduleConfig = {
              "niri/window" = {
                "format" = "{}";
                "rewrite" = {
                  "(.*) — Mozilla Firefox" = "$1";
                };
                "icons" = true;
              };
              "niri/workspaces" = {
                # current-only = true;
              };
              "mpd" = {
                "format" = "{artist}: {title} ~ [{elapsedTime:%M:%S}/{totalTime:%M:%S}] ~ {volume}%";
                "format-disconnected" = "Disconnected";
                "format-stopped" = "Stopped ";
                "unknown-tag" = "N/A";
                "interval" = 1;
                "tooltip-format" = "{artist}\n({date}) {album} - {title}";
                "tooltip-format-disconnected" = "disconnected ";
                "on-click" = "mpc toggle";
                "on-scroll-up" = "mpc volume +1";
                "on-scroll-down" = "mpc volume -1";
                "smooth-scrolling-threshhold" = 0.3;
                "max-length" = 140;
              };

              "clock" = {
                "tooltip-format" = "<big>{:%d. %B %Y - %H:%M}</big>";
                "format" = "{:%H:%M}";
              };

              "cpu" = {
                "format" = "{usage:2}% ";
              };

              "memory" = {
                "format" = "{percentage:2}% 󰍛";
              };

              "wireplumber" = {
                "format" = "{volume:2}% 󰋋";
                "on-scroll-up" = "volumectl --change-volume +1";
                "on-scroll-down" = "volumectl --change-volume -1";
              };

              "battery" = {
                "format" = "{capacity}% {icon}";
                "format-icons" = [
                  "󰁺"
                  "󰁼"
                  "󰁾"
                  "󰂀"
                  "󰂂"
                ];
              };
            };
            shared = moduleConfig // {
              "layer" = "top";
              "position" = "top";
              "spacing" = 0;
            };
          in
          {
            mainBar = {
              # TODO
              "output" = "eDP-1";
              "modules-left" = [
                "niri/workspaces"
                "niri/window"
              ];
              "modules-center" = [ "mpd" ];
              "modules-right" = [
                "wireplumber"
                "cpu"
                "memory"
                "battery"
                "clock"
              ];
            } // shared;
            otherBars = {
              "output" = "!eDP-1";
              "modules-left" = [
                "hyprland/submap"
                "hyprland/workspaces"
                "hyprland/window"
              ];
              "modules-center" = [ ];
              "modules-right" = [ "clock" ];
            } // shared;
          };
      };
    };
  };
}
