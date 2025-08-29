{lib, pkgs, ...}:
{
  # DE
  services.xserver.enable = true;
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
 
  # DISPLAYLINK DRIVER
  nixpkgs.config.allowUnfree = true;
  services.xserver.videoDrivers = [ "displaylink" "modesetting" ]; 
  services.xserver.displayManager.sessionCommands = ''
    ${lib.getBin pkgs.xorg.xrandr}/bin/xrandr --setprovideroutputsource 2 0
  '';
  systemd.services.dlm.wantedBy = [ "multi-user.target" ];
  environment.systemPackages = with pkgs; [
     gnomeExtensions.user-themes
     gnomeExtensions.arcmenu
     gnomeExtensions.blur-my-shell
     gnomeExtensions.hide-cursor
     gnomeExtensions.dash-to-panel
     gnome-tweaks # For managing extensions
     gnomeExtensions.paperwm
     gnomeExtensions.caffeine
     gnomeExtensions.just-perfection
     gnomeExtensions.unite
     gnomeExtensions.media-controls
     gnomeExtensions.weather-oclock
     gnome-weather
     gnomeExtensions.burn-my-windows
  ];
}

