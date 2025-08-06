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
  syntaxHighlighting.enable = true;
  completionInit = "eval \"$(direnv hook zsh)\" && clear && nitch";
  shellAliases = {
	nvimc = "ghostty -e nvim .";
	storage = "nix-shell -p ncdu --command 'ncdu /'";
  };
  zplug = {
    enable = true;
    plugins = [
      { name = "marlonrichert/zsh-autocomplete"; } # Simple plugin installation
      { name = "zsh-users/zsh-autosuggestions"; }
      { name = "chisui/zsh-nix-shell"; }
    ];
  };
  oh-my-zsh = {
    enable = true;
    plugins = [
      "git"
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
	#      themes = {
	# kanagawa-wave = {
	#   background = "#1f1f28";
	#   foreground = "#dcd7ba";
	#   cursor-color = "#c8c093";
	#   palette = [
	#         "0=#16161d"
	# 	"1=#c34043"
	# 	"2=#76946a"
	# 	"3=#c0a36e"
	# 	"4=#7e9cd8"
	# 	"5=#957fb8"
	# 	"6=#6a9589"
	# 	"7=#c8c093"
	# 	"8=#727169"
	# 	"9=#e82424"
	# 	"10=#98bb6c"
	# 	"11=#e6c384"
	# 	"12=#7fb4ca"
	# 	"13=#938aa9"
	# 	"14=#7aa89f"
	# 	"15=#dcd7ba"
	#   ];
	#   selection-background = "#2d4f67";
	#   selection-foreground = "#c8c093";
	# };
	#    };
	#
    settings = {
      font-family = "Maple Mono NF";
      font-feature = "liga, calt, dlig, keep-infinite-arrow=true";
      window-decoration = "false";
      command = "zsh";
      confirm-close-surface = "false";
      theme = "Kanagawa Wave";
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
