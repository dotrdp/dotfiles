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

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = pkgs.lib.mkForce {
        color-scheme = "prefer-dark";
        cursor-theme = "BreezeX-RosePine-Linux";
      };
      "org/gnome/desktop/applications/terminal" = {
        exec = "ghostty";
      };
    };
  };

  programs.starship = {
    enable = true;
  };

  programs.rmpc = {
    enable = true;
  };
  services.mpd = {
    enable = true;
    musicDirectory = "/home/rd/Music/";
    # Optional:
    network.listenAddress = "any"; # if you want to allow non-localhost connections
    network.startWhenNeeded = true; # systemd feature: only start MPD service upon connection to its socket
  };

  xdg.configFile."starship.toml".source = ../../dotfiles/starship.toml;
  xdg.configFile."rmpc/config.ron".source = ../../dotfiles/rmpc/config.ron;
  imports = [
	../../dotfiles/zsh.nix
	../../dotfiles/ghostty.nix
	../../dotfiles/clock-rs.nix
];
  

  home.stateVersion = "25.11";


  programs.home-manager.enable = true;
}
