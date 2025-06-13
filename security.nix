{ pkgs, lib, ... }:

{
  
  services.fail2ban.enable = true;
  security.pam.services.hyprlock = {};
  security.pam.services.lightdm.enableGnomeKeyring = true;
  
  environment.systemPackages = with pkgs; [
    vulnix       #scan command: vulnix --system
    chkrootkit   #scan command: sudo chkrootkit
  ];
}
