{
	           home-manager.useGlobalPkgs = true;
	           home-manager.useUserPackages = true;
	           home-manager.users.rd = ./home.nix;
	           home-manager.backupFileExtension = "backup";
	           # Optionally, use home-manager.extraSpecialArgs to pass
	           # arguments to home.nix
}
