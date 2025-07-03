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

    #gtk3.extraConfig.Settings = "gtk-application-prefer-dark-theme=1";
    #gtk4.extraConfig.Settings = "gtk-application-prefer-dark-theme=1";
  };

programs.zsh = {
  enable = true;
  completionInit = "nitch";
  zplug = {
    enable = true;
    plugins = [
      { name = "marlonrichert/zsh-autocomplete"; } # Simple plugin installation
      { name = "zsh-users/zsh-autosuggestions"; }
    ];
  };
};

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = pkgs.lib.mkForce {
        color-scheme = "prefer-dark";
        cursor-theme = "BreezeX-RosePine-Linux";
      };
      "org/gnome/desktop/applications/terminal" = {
        exec = "alacritty";
      };
    };
  };

  #programs.alacritty = {
 #   enable = true;
#    
    #settings = {
   #   general = {
  #      import = ["~/.config/colorscheme.toml"];
 #     };
#      font = {
      #  normal = {
     #    family = "FiraCode Nerd Font";
    #    };
   #   };
  #    window = {
 #       decorations = "None";
#      };
      #terminal = {
     # shell = {
    #    program = "zsh";
   #     };
  #    };
 #   };
#  };

  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      font-family = "FiraCode Nerd Font";
      font-feature = [ "-liga" ];
      window-decoration = "false";
      initial-command = "zsh";
      theme = "carbonfox";
    };
  };

  programs.helix = {
    enable = true;
  };

  programs.starship = {
    enable = true;
  };
  
    
   
    

 



  home.stateVersion = "25.11";

  programs.home-manager.enable = true;
}