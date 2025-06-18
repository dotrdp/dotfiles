{ config, pkgs, ... }:

{
  home.username = "rd";
  home.homeDirectory = "/home/rd";

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };

  gtk = {
    enable = true;

    theme = {
      package = pkgs.gnome-themes-extra;
      name = "Adwaita-dark";
    };

    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };

    font = {
      name = "Sans";
      size = 11;
    };

    gtk3.extraConfig.Settings = "gtk-application-prefer-dark-theme=1";
    gtk4.extraConfig.Settings = "gtk-application-prefer-dark-theme=1";
  };

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
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