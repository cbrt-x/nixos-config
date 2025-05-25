{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      <home-manager/nixos>
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console.keyMap = "de-latin1";

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jade = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };
  home-manager.users.jade = { pkgs, ... }: {
    programs.alacritty.enable = true;
    programs.git.enable = true;
    programs.firefox.enable = true;

    programs.neovim = {
      enable = true;
      defaultEditor = true;
    };

    home.sessionVariables = {
        # LIVBVA_DRIVER_NAME = "nvidia";
        # __GLX_VENDOR_LIBRARY_NAME = "nvidia";
        # GBM_BACKEND = "nvidia-drm";
        XDG_SESSION_TYPE = "wayland";
        XDG_CURRENT_DESKTOP = "Hyprland";
    };


    wayland.windowManager.hyprland = {
      enable = true;
      settings = {
        "$mod" = "SUPER";
        bind = [
          "$mod, return, exec, alacritty"
          "$mod, W, killactive"
          "$mod, F, exec, firefox"
        ];
        monitor = ", highres, auto, 1";
        general = {
          gaps_in = 2;
          gaps_out = 3;
          border_size = 2;

          "col.inactive_border" = "rgba(2F303870)";
          "col.active_border" = "rgb(23d1fc)";

          layout = "dwindle";
        };

        animations = {
          enabled = "yes";
          bezier = "myBezier, 0.45, 0, 0.2, 1";

          animation = [
            "border,         1, 5,   myBezier"
            "workspaces,     1, 5,   myBezier, fade"
            "windows,        1, 5,   myBezier"
            "windowsIn,      1, 8,   myBezier"
            "windowsOut,     1, 8,   myBezier"
            "fade,           1, 5,   myBezier"
            "borderangle,    0, 1,   default"
          ];
        };
        cursor = {
            no_hardware_cursors = true;
        };
        decoration = {
            rounding = 4;
        };
        input = {
            kb_layout = "de";
            follow_mouse = 1;
        };
        misc.disable_hyprland_logo = true;
      };
    };

    home.stateVersion = "25.11";

    programs.home-manager.enable = true;
  };

  # enable hyprland module on top of home manager; handles session files etc.
  programs.hyprland.enable = true;

  environment.systemPackages = with pkgs; [
    ly
    tree
  ];

  services = {
    displayManager.ly.enable = true;
  };

  # *DO NOT CHANGE*
  system.stateVersion = "24.11"; # Did you read the comment?
}

