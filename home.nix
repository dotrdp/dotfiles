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
  completionInit = "eval \"$(direnv hook zsh)\" && clear && nitch";
  shellAliases = {
  };
  zplug = {
    enable = true;
    plugins = [
      { name = "marlonrichert/zsh-autocomplete"; } # Simple plugin installation
      { name = "zsh-users/zsh-autosuggestions"; }
      { name = "chisui/zsh-nix-shell"; }
    ];
  };
};
programs.command-not-found.enable = true;

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
      font-family = "MonoLisa Nerd Font";
      font-feature = "liga, calt, dlig";
      window-decoration = "false";
      command = "zsh";
      theme = "carbonfox";
      confirm-close-surface = "false";
    };
  };

  # programs.helix = {
  #   enable = true;
  #   settings = {
  #     theme = "carbonfox";
  #     editor = {
  #       whitespace = {
  #         render = {
  #           newline = "all";
  #         };
  #         characters = {
  #           newline = "›";
  #         };
  #       };
  #       indent-guides = {
  #         render = true;
  #         character = "→";
  #       };
  #     };
  #   };
  # }; ADIOSSSS HELIXXX NOOOOOOOOOOOOOOOOOOOOOO

  programs.starship = {
    enable = true;
  };

  home.stateVersion = "25.11";


  programs.home-manager.enable = true;
}
