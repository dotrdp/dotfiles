{ config, lib, pkgs, inputs, ... }:

{
  hardware.asahi = {
    useExperimentalGPUDriver = true;
    peripheralFirmwareDirectory = ./firmware;
    setupAsahiSound = true;
  };
  services.xserver.videoDrivers = [ "displaylink" "modesetting" ]; 
  services.xserver.displayManager.sessionCommands = ''
    ${lib.getBin pkgs.xorg.xrandr}/bin/xrandr --setprovideroutputsource 2 0
  '';
  systemd.services.dlm.wantedBy = [ "multi-user.target" ];
}