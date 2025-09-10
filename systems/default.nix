{
  inputs,
  self,
  ...
}: let
  inherit (inputs) niri home-manager nixpkgs;

  systemNames = [
    {
      name = "rdp";
      arch = "aarch64-linux";
      extramodules = [ niri.nixosModules.niri ];
    }
];

  mkSystem = extramodules: sysName: sysArch: 
	let hmc = import ../home-manager/${sysName};
		in
    nixpkgs.lib.nixosSystem {
      # TODO: move this to the host itself
      system = sysArch;
      specialArgs = {inherit inputs self;};

# nixpkgs.lib.filesystem.listFilesRecursive ./${sysName} ++ 
	modules = [
	./${sysName}
	home-manager.nixosModules.home-manager hmc
	] ++ extramodules;
    };

  systems = map (sys: {${sys.name} = mkSystem sys.extramodules sys.name sys.arch;}) systemNames;  

  nixosystems = nixpkgs.lib.foldr (coming: final: final // coming) {} systems;
in
  nixosystems 
