{
  description = "rd dotfiles";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";

    apple-silicon-support.url = "github:tpwrules/nixos-apple-silicon";
  };

  outputs = { self, nixpkgs, home-manager, ... } @inputs: {
    nixosConfigurations = import ./systems { inherit inputs self; };
	};
}
