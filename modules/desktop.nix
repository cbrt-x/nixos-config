{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.desktop;
in
{
  imports = [
  ];

  options = {
    desktop = {
        enable = lib.mkEnableOption "Enable Desktop";
    };
  };

  config = lib.mkIf cfg.enable {

    home-manager.users.jade = {
      # waybar.enable = true;

      # xdg.enable = false;
      # xdg.portal.enable = false;

      gtk = {
        enable = true;
        theme = {
          package = pkgs.magnetic-catppuccin-gtk;
          name = "Catppuccin-GTK-Dark";
        };
        cursorTheme = {
          package = pkgs.bibata-cursors;
          # TODO
          name = "Bibata-Modern-Ice";
        };
      };
    };
  };
}
