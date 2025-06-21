{ config, pkgs, ... }:

{
  home.username = "rd";
  home.homeDirectory = "/home/rd";

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.rose-pine-cursor;
    name = "rose-pine-cursor";
    size = 20; #gsettings set org.gnome.desktop.interface cursor-theme BreezeX-RosePine-Linux
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

    gtk3.extraConfig.Settings = "gtk-application-prefer-dark-theme=1";
    gtk4.extraConfig.Settings = "gtk-application-prefer-dark-theme=1";
  };

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = pkgs.lib.mkForce {
        color-scheme = "prefer-dark";
        cursor-theme = "BreezeX-RosePine-Linux";
      };

    };
  };
  programs.kitty = {
      enable = true;
   
      settings = {
        font_family = "Inconsolata Nerd Font Mono";
        bold_font = "Inconsolata Nerd Font Mono Extra Bold";
        bold_italic_font = "Inconsolata Nerd Font Mono Extra Bold Italic";
        shell = "fish";
        cursor_trail = "1";
        cursor_trail_decay = "0.1 0.4";
        font_size = "13.0";
        confirm_os_window_close = "0";
        hide_window_decorations = "no";
        wayland_titlebar_color = "background";
      };
      themeFile = "Catppuccin-Macchiato";
  };


    programs.fish = {
      enable = true;
      loginShellInit = "starship init fish | source"; 
     

      # Disable Fish greeting & add ~/bin to path
      shellInit = ''
        set fish_greeting
        set PATH "$HOME/bin:$PATH"
        nitch
      '';
    };
    programs.starship = {
      enable = true;
    };
    

 



  home.stateVersion = "25.11";

  programs.home-manager.enable = true;
}