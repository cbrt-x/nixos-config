{ ... }:
{
  home-manager.users.jade.programs = {
    git = {
      enable = true;
      delta.enable = true;
      maintenance.enable = true;

      userName = "cbrt-x";
      userEmail = "jade512@proton.me";
    };
  };
}
