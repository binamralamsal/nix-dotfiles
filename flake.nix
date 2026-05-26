{
  description = "Binamra NixOS config";

  inputs = {
    nixpkgs.url =
      "github:NixOS/nixpkgs/nixos-25.11";

    home-manager.url =
      "github:nix-community/home-manager/release-25.11";

    home-manager.inputs.nixpkgs.follows =
      "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
  {
    nixosConfigurations.binamra =
      nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          ./hosts/binamra/configuration.nix

          home-manager.nixosModules.home-manager

          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users.binamra =
              import ./home/binamra/home.nix;
          }
        ];
      };
  };
}
