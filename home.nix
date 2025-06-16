{ config, pkgs, ... }:

{
  home.username = "rd";
  home.homeDirectory = "/home/rd";
  imports = [
    
  ];
  gtk = {
    enable = true;
    theme = {
      name = "Qogir-Dark";
      package = pkgs.qogir-theme;
    };
    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 36;
    };
    iconTheme = {
      name = "WhiteSur-dark";
      package = pkgs.whitesur-icon-theme;
    };
  };

 



  home.stateVersion = "25.11";

  programs.home-manager.enable = true;
}