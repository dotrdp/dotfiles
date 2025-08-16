{
  inputs,
  self,
  ...
}: let
  inherit (inputs) home-manager nixpkgs;

  systemNames = [
    {
      name = "rdp";
      arch = "aarch64-linux";
    }
];

  mkSystem = sysName: sysArch: 
    nixpkgs.lib.nixosSystem {
      # TODO: move this to the host itself
      system = sysArch;
      specialArgs = {inherit inputs self;};

	modules = nixpkgs.lib.filesystem.listFilesRecursive ./${sysName} ++ [
        home-manager.nixosModules.home-manager
	{
	           home-manager.useGlobalPkgs = true;
	           home-manager.useUserPackages = true;
	           home-manager.users.rd = ../home.nix;
	           home-manager.backupFileExtension = "backup";
	           # Optionally, use home-manager.extraSpecialArgs to pass
	           # arguments to home.nix
	}
	];
    };

  systems = map (sys: {${sys.name} = mkSystem sys.name sys.arch;}) systemNames;  

  nixosystems = nixpkgs.lib.foldr (coming: final: final // coming) {} systems;
in
  nixosystems 
