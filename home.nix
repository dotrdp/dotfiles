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
      size = 46;
    };
    iconTheme = {
      name = "WhiteSur-dark";
      package = pkgs.whitesur-icon-theme;
    };
  };
  
  programs.kitty = {
      enable = true;
      settings = {
        font_family = "JetBrainsMono Nerd Font Mono";
        bold_font = "JetBrainsMono Nerd Font Mono Extra Bold";
        bold_italic_font = "JetBrainsMono Nerd Font Mono Extra Bold Italic";
        shell = "fish";
        cursor_trail = "1";
        font_size = "13.0";
      };
      themeFile = "Catppuccin-Macchiato";
  };


    programs.fish = {
      enable = true;
      plugins = [
        {
          name = "tide";
          inherit (pkgs.fishPlugins.tide) src;
        }
      ];
     

      # Disable Fish greeting & add ~/bin to path
      shellInit = ''
        set fish_greeting
        set PATH "$HOME/bin:$PATH"
        nitch
      '';
    };


 



  home.stateVersion = "25.11";

  programs.home-manager.enable = true;
}
