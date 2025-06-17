{
  description = "rd dotfiles";

  inputs = {
    pkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    zen-browser.url = "github:youwen5/zen-browser-flake";

  # optional, but recommended if you closely follow NixOS unstable so it shares
  # system libraries, and improves startup time
  # NOTE: if you experience a build failure with Zen, the first thing to check is to remove this line!
    zen-browser.inputs.nixpkgs.follows = "pkgs"; 
  };

  outputs = { self, pkgs, home-manager, ... } @inputs: {
    nixosConfigurations.nixos = pkgs.lib.nixosSystem {
      system = "aarch64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./configuration.nix
        ./quickshell/default.nix
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
