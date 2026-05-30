{
  description = "Binamra NixOS config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

    hyprland.url = "github:hyprwm/Hyprland";

    home-manager.url = "github:nix-community/home-manager/release-25.11";

    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    helium-flake.url = "github:oxcl/nix-flake-helium-browser";
    helium-flake.inputs.nixpkgs.follows = "nixpkgs";

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nur,
      hyprland,
      helium-flake,
      ...
    }@inputs:
    {
      nixosConfigurations.binamra = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          nur.modules.nixos.default
	  {
            nixpkgs.overlays = [
              helium-flake.overlays.default
            ];
          }
          ./configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.binamra = import ./home.nix;
          }
        ];
      };
    };
}
