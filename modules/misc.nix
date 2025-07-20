{ ... }:

{
  home-manager = {
    users.jade = {
      programs = {

      };

      home.stateVersion = "25.05";
      programs.home-manager.enable = true;
    };

    useUserPackages = true;
    useGlobalPkgs = true;
  };
}
