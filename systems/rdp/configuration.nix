# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{inputs, config, lib, pkgs, ... }:

{
  imports =
    [ 
      inputs.apple-silicon-support.nixosModules.apple-silicon-support
    ];
  #HARDWARE  
 hardware.bluetooth = {
    enable = true;
    settings = {
      General = {
        Experimental = "true";
      };
    };
  };
  hardware.asahi.useExperimentalGPUDriver = true;    
  hardware.asahi.setupAsahiSound = true;

  hardware.asahi.peripheralFirmwareDirectory = ./firmware;
  hardware.keyboard.qmk.enable = true;
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = false;

  swapDevices = [{
    device = "/swapfile";
    size = 16 * 1024; # 16GB
  }];
  zramSwap.enable = true;

  # boot.binfmt.emulatedSystems = ["i686-linux" "x86_64-linux" "i386-linux" "i486-linux" "i586-linux" "i686-linux"];
  # nix.settings.extra-platforms = ["i686-linux" "x86_64-linux" "i386-linux" "i486-linux" "i586-linux" "i686-linux"];
  #FLAKE
  nix.settings.experimental-features = [ "flakes" "nix-command" ];
  # boot.binfmt.emulatedSystems = [ "x86_64-linux" ];
  # nix.settings.extra-platforms = [ "x86_64-linux" ];
  # NETWORK STUFF
  networking.hostName = "rdp";
  networking.wireless.iwd = {
  enable = true;
  settings.General.EnableNetworkConfiguration = true;
  };
  time.timeZone = "America/Mexico_City";
  i18n.defaultLocale = "en_US.UTF-8";
  

  # DE
  services.xserver.enable = true;
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
 
  # DISPLAYLINK DRIVER
  nixpkgs.config.allowUnfree = true;
  services.xserver.videoDrivers = [ "displaylink" "modesetting" ]; 
  services.xserver.displayManager.sessionCommands = ''
    ${lib.getBin pkgs.xorg.xrandr}/bin/xrandr --setprovideroutputsource 2 0
  '';
  systemd.services.dlm.wantedBy = [ "multi-user.target" ];

  services.xserver.xkb.layout = "es";
  services.printing.enable = true;
  services.pipewire = {
     enable = true;
     pulse.enable = true;
   };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.rd = {
     isNormalUser = true;
     extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
     packages = with pkgs; [
       tree
     ];
     
   };
  
  # PROGRAMS
  programs.firefox.enable = true;

    #packages
  fonts.packages = with pkgs; [
    maple-mono.NF-unhinted
  ];

  
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
	lua-language-server
  ];
  environment.variables = {
  	EDITOR = "nvim";
  };
# NOTE: [INFO] SYSTEM PACKAGES
  environment.systemPackages = [
     pkgs.wget

     pkgs.neovim
     pkgs.gcc
     pkgs.ripgrep
     pkgs.fd
     pkgs.wl-clipboard
     pkgs.xclip
     pkgs.gnumake42
     pkgs.vimPlugins.lazydev-nvim
     pkgs.nil
     pkgs.stylua
     pkgs.luajitPackages.luacheck
     pkgs.lazygit
     pkgs.cava

     pkgs.nodejs_20
     pkgs.vivaldi
     pkgs.vivaldi-ffmpeg-codecs

     pkgs.gh-copilot
     pkgs.gh

     pkgs.tlrc

     # pkgs.mpd
     pkgs.playerctl
     pkgs.yt-dlp
     pkgs.ffmpeg-full

     pkgs.git
     pkgs.nitch

     pkgs.asahi-bless
     pkgs.mesa

     pkgs.direnv
     

     pkgs.gnomeExtensions.arcmenu
     

     pkgs.gnomeExtensions.blur-my-shell
     pkgs.gnomeExtensions.hide-cursor
     pkgs.gnomeExtensions.dash-to-panel
     pkgs.gnome-tweaks # For managing extensions
     pkgs.gnomeExtensions.paperwm
     pkgs.gnomeExtensions.media-controls
     pkgs.gnomeExtensions.weather-oclock
     pkgs.gnome-weather
     pkgs.rose-pine-cursor
     pkgs.unzip
     pkgs.btop
     pkgs.fastfetch

     pkgs.python3Full
     pkgs.pyright
     pkgs.uv
    
   ];

  # ssh
  programs.mtr.enable = true;
  programs.ssh.startAgent = true;
  services.openssh.enable = true;
  services.gnome.gcr-ssh-agent.enable = false;
  #DO NOT CHANGE THIS; PORFAVOR NOOOOO; NO LO MUEVAS; NO LO CAMBIES; NO HAY FORMA EN QUE PUEDA SALIR BIEN
  system.stateVersion = "25.11"; # Did you read the comment?
  
}
