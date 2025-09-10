{
  description = "rd dotfiles";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";

    apple-silicon-support.url = "github:tpwrules/nixos-apple-silicon";
    niri-override.url = "github:scottmckendry/niri/primary-render-fallback";
    niri.url = "github:sodiboo/niri-flake";
  };

  outputs = { self, nixpkgs, home-manager, ... } @inputs: {
    nixosConfigurations = import ./systems { inherit inputs self; };
	};
}
