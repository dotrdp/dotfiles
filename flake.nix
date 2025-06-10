{
  description = "rd dotfiles";

  inputs = {
    pkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    # home-manager.url = "github:nix-community/home-manager";
  };

  outputs = { self, pkgs, ... } @inputs: {
    nixosConfigurations.rd = pkgs.lib.nixosSystem {
      system = "aarch64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./configuration.nix
      ];
    };
  };
}
