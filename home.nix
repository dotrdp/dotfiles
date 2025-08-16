{ config, pkgs, ... }:

{
  home.username = "rd";
  # home.homeDirectory = "/home/rd";

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
  initContent = "eval \"$(direnv hook zsh)\" && clear && nitch";
  shellAliases = {
	nvimc = "ghostty -e nvim .";
	storage = "nix-shell -p ncdu --command 'ncdu /'";
	macos = "sudo asahi-bless --next --set-boot-macos -y && reboot";
  };
  zplug = {
    enable = true;
    plugins = [
      { name = "zsh-users/zsh-completions"; } 
      { name = "zsh-users/zsh-autosuggestions"; }
      { name = "chisui/zsh-nix-shell"; }
      { name = "zsh-users/zsh-history-substring-search"; }
      { name = "MichaelAquilina/zsh-you-should-use"; }
      { name = "atuinsh/atuin"; }
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
    settings = {
      font-family = "Maple Mono NF";
      font-feature = "liga, calt, dlig, keep-infinite-arrow=true";
      window-decoration = "false";
      command = "zsh";
      confirm-close-surface = "false";
      theme = "Kanagawa Wave";
      };
  };

  programs.starship = {
    enable = true;
  };
  xdg.configFile."starship.toml".source = .config/starship.toml;

  home.stateVersion = "25.11";


  programs.home-manager.enable = true;
}
