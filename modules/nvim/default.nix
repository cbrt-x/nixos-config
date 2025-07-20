{ ... }:

{
  home-manager.users.jade = {
    programs.neovim = {
      enable = true;
      defaultEditor = true;
    };

    xdg.configFile.neovim-config = {
      source = ./. + "/config";
      target = "nvim";
      recursive = true;
    };
  };
}
