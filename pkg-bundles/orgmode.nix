{lib, pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
	google-drive-ocamlfuse
	syncthing
  ];
}

