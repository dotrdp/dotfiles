{
  description = "rd dotfiles";

  inputs = {
    pkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
 
  };

  outputs = { self, pkgs, home-manager, ... } @inputs: {
    nixosConfigurations.nixos = pkgs.lib.nixosSystem {
      system = "aarch64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.rd = ./home.nix;
            home-manager.backupFileExtension = "backup";
            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
          }
      ];
    };
  };
}
