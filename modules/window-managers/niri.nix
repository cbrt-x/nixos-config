{
  config,
  pkgs,
  inputs,
  ...
}:

{

  nixpkgs.overlays = [ inputs.niri.overlays.niri ];
  programs.niri = {
    enable = false;
    package = pkgs.niri-unstable;
  };
  home-manager.users.jade = {
    home.packages = [ pkgs.swaybg ];
    programs.niri.settings = {
      binds =
        with config.lib.niri.actions;
        {
          "Mod+Return".action = spawn "alacritty";

          "Mod+F".action = spawn "firefox";
          "Mod+W".action = close-window;

          "Mod+less".action = switch-preset-column-width;
          "Mod+Y".action = expand-column-to-available-width;

          "Mod+Left".action = focus-column-left;
          "Mod+Right".action = focus-column-right;

          "Mod+Up".action = focus-window-up;
          "Mod+Down".action = focus-window-down;
          "Mod+minus".action = toggle-column-tabbed-display;

          "Mod+Ctrl+Left".action = move-column-left;
          "Mod+Ctrl+Right".action = move-column-right;

          "Mod+Comma".action = consume-or-expel-window-left;
          "Mod+Period".action = consume-or-expel-window-right;

          "Mod+O".action = toggle-overview;
        }
        // builtins.listToAttrs (
          builtins.genList (
            i:
            let
              ws = i + 1;
            in
            {
              name = "Mod+${toString ws}";
              value = {
                action.focus-workspace = ws;
              };
            }
          ) 9
        );

      input = {
        touchpad.natural-scroll = false;
        keyboard.xkb.layout = "de";
        focus-follows-mouse.enable = true;
      };

      cursor = {
        hide-after-inactive-ms = 1000;
        # theme =
      };

      prefer-no-csd = true;

      overview.backdrop-color = "rgb(12 13 20)";

      layout = {
        border = {
          enable = true;
          active.color = "rgb(100 200 150)";
          inactive.color = "rgb(60 60 80)";
        };
        focus-ring.enable = false;
        gaps = 3;

        default-column-width = {
          proportion = 1. / 2.;
        };
        preset-column-widths = [
          { proportion = 1. / 2.; }
          { proportion = 2. / 3.; }
          { proportion = 1.; }
        ];

        tab-indicator = {
          gap = 5;
          position = "left";
          corner-radius = 5;
          place-within-column = true;
          hide-when-single-tab = true;
        };
      };

      workspaces = {
        "1" = {
          name = "general purpose";
        };
        "2" = {
          name = "dev";
        };
        "3" = {
          name = "music";
        };
        "4" = {
          name = "gaming";
        };
      };

      hotkey-overlay.skip-at-startup = true;

      spawn-at-startup = [
        {
          command = [
            "swaybg"
            "-c"
            "151518"
          ];
        }
      ];

      window-rules = [
        {
          geometry-corner-radius = {
            bottom-left = 5.0;
            bottom-right = 5.0;
            top-left = 5.0;
            top-right = 5.0;
          };
          clip-to-geometry = true;
        }
      ];
    };
  };
}
