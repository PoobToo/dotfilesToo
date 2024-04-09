{
  description = "The first one";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... } @ inputs:
    let
      inherit (self) outputs;
      lib = nixpkgs.lib;
      system = "x86_64-linux";
    in
    {
      overlays = import ./overlays { inherit inputs; };
      nixosConfigurations = {
        radish = lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs outputs; };
          modules = [ ./configuration.nix ];
        };
      };
      homeConfigurations = {
        leo = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs { inherit system; };
          extraSpecialArgs = { inherit inputs; };
          modules = [ ./home.nix ];
        };
      };
    };


}
