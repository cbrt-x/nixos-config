{
  description = "nixos config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri.url = "github:sodiboo/niri-flake";
  };

  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      niri,
      ...
    }:
    let
      defineHost =
        { hostName, system }:
        {
          ${hostName} = nixpkgs.lib.nixosSystem {
            inherit system;
            specialArgs = {
              inherit hostName inputs;
            };
            modules = [
              ./hosts/${hostName}
              ./hosts/shared.nix

              # TODO make into its own module
              home-manager.nixosModules.home-manager
              {
                home-manager = {
                };
              }
              niri.nixosModules.niri
            ];
          };
        };
    in
    {
      nixosConfigurations = defineHost {
        hostName = "thinkpad";
        system = "x86_64-linux";
      };
    };
}
