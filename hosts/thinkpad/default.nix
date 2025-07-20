{
  ...
}:

{
  imports = [
    ./hardware-configuration.nix

    ../../modules/nvim
    ../../modules/window-managers/hyprland.nix
    ../../modules/alacritty.nix
    ../../modules/desktop.nix
    ../../modules/firefox.nix
    ../../modules/misc.nix
    ../../modules/waybar
    ../../modules/shell.nix
    ../../modules/development.nix
  ];

  boot.loader.systemd-boot.enable = true;

  waybar.enable = true;
  desktop.enable = true;


  users.users.jade = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };


  # *DO NOT CHANGE*
  system.stateVersion = "24.11"; # Did you read the comment?
}
