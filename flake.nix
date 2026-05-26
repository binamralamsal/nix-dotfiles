{
  description = "Binamra NixOS config";

  inputs = {
    nixpkgs.url =
      "github:NixOS/nixpkgs/nixos-25.11";

    home-manager.url =
      "github:nix-community/home-manager/release-25.11";

    home-manager.inputs.nixpkgs.follows =
      "nixpkgs";

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nur, ... }:
  {
    nixosConfigurations.binamra =
      nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
	  nur.modules.nixos.default

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
