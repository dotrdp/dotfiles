
{inputs, config, lib, pkgs, ... }:
let
  niri-package = inputs.niri-override.packages.${pkgs.system}.niri;
in
{
  programs.niri = {
    enable = true;
    package = niri-package;
  };

  environment.etc."xdg/wayland-sessions/niri.desktop".text = ''
      [Desktop Entry]
      Name=Niri
      Comment=Start Niri session
      Exec=${niri-package}/bin/niri-session
      Type=Application
      DesktopNames=Niri
    '';
}
