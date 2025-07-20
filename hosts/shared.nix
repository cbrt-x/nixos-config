{ hostName, pkgs, ... }:

{
  nix = {
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
    channel.enable = false;
  };

  networking = {
    inherit hostName;
    networkmanager.enable = true;
  };

  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "en_US.UTF-8";
  console.keyMap = "de-latin1";

  environment = {
    systemPackages = with pkgs; [
      tree
      nixfmt-rfc-style
      nixd

      # TODO
      ripgrep
      wl-clipboard
      grim
      slurp
    ];
    shellAliases = {
      # allows sudo to resolve other aliases
      sudo = "sudo ";

      ls = "ls --color=auto -h";
      la = "ls -lA";
      ll = "ls -1";
      df = "df -H";
      tree = "tree -C";

      system-rebuild = "sudo nixos-rebuild --flake ~/nixos#${hostName}";
    };
  };


  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  services = {
    displayManager = {
      environment = {
        # XDG_CURRENT_DESKTOP = "X-NIXOS-SYSTEMD-AWARE";
      };
      ly = {
        enable = true;
        settings = {
          animation = "matrix";
          hide_borders = false;
          fg = 6;
          asterisk = "*";
        };
      };
    };
    pipewire = {
      enable = true;
      pulse.enable = true;
    };
  };
}
