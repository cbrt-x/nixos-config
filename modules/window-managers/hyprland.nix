{ ... }:
{
  programs.hyprland.enable = true;
  home-manager.users.jade = {
    wayland.windowManager.hyprland = {
      enable = true;
      # managed through uwsm
      # systemd.enable = false;
      settings = {
        "$mod" = "SUPER";
        bind =
          [
            "$mod, return, exec, alacritty"
            "$mod, W, killactive"
            "$mod, F, exec, firefox"
            '', Print, exec, grim -g "''${slurp}" | wl-copy''
          ]
          ++ (builtins.concatLists (
            builtins.genList (
              i:
              let
                ws = i + 1;
              in
              [
                "$mod, code:1${toString i}, moveworkspacetomonitor, ${toString ws} current"
                "$mod, code:1${toString i}, workspace, ${toString ws}"
                "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
              ]
            ) 9
          ));
        monitor = ", highres, auto, 1";
        general = {
          gaps_in = 3;
          gaps_out = 5;
          border_size = 3;

          "col.inactive_border" = "rgba(2F303870)";
          "col.active_border" = "rgb(23d1fc)";

          layout = "dwindle";
        };

        animations =
          let
            animation = "timeline";
            animate =
              name: style: "${name}, 1, 5, ${animation}" + (if style != null then (", " + style) else "");
          in
          {
            enabled = "yes";
            bezier = "${animation}, 0.25, 0.75, 0.7, 1";
            animation = [
              (animate "border" null)
              (animate "workspaces" "fade")
              (animate "windows" "popin 50%")
            ];
          };
        cursor = {
          no_hardware_cursors = true;
        };
        decoration = {
          rounding = 7;
        };
        input = {
          kb_layout = "de";
          follow_mouse = 1;
        };
        misc.disable_hyprland_logo = true;
      };
    };
  };
}
