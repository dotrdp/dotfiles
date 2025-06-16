# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{inputs, config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./apple-silicon-support
     
    ];
  #HARDWARE  
  hardware.bluetooth.enable = true;
  hardware.asahi.useExperimentalGPUDriver = true;    
  hardware.asahi.setupAsahiSound = true;
  hardware.asahi.peripheralFirmwareDirectory = ./firmware;
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = false;
  #FLAKE
  nix.settings.experimental-features = [ "flakes" "nix-command" ];
  # NETWORK STUFF
  networking.hostName = "nixos";
  networking.wireless.iwd = {
  enable = true;
  settings.General.EnableNetworkConfiguration = true;
  };
  time.timeZone = "America/Mexico_City";
  i18n.defaultLocale = "en_US.UTF-8";
  

  # DE
  services.xserver = {
    # Enable the X11 windowing system.
    enable = true;

    # Enable the XFCE Desktop Environment.
    displayManager = {
      gdm = {
        enable = true;
      };
      sessionPackages = [ pkgs.niri ];
    };
    desktopManager = {
      xterm.enable = false;
    };
  };
  programs.niri.enable = true;

  
  # DISPLAYLINK DRIVER
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
  nixpkgs.config.allowUnfree = true;
  
  # PROGRAMS
  programs.firefox.enable = true;
  # PACKAGES
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    # gtk portal needed to make gtk apps happy
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
  environment.systemPackages = [
     pkgs.wget
     pkgs.kitty
     pkgs.git
     pkgs.spyder
     pkgs.whitesur-icon-theme
     pkgs.qogir-icon-theme
     pkgs.qogir-theme
     pkgs.mako
     pkgs.gnome-keyring
     pkgs.fuzzel
     pkgs.xwayland-satellite
     pkgs.waybar

    

     
     inputs.zen-browser.packages.${pkgs.system}.default
     pkgs.unzip
     pkgs.btop
     pkgs.fastfetch
     #VSCODE STUFF
    (pkgs.vscode-with-extensions.override {
    vscodeExtensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
      nonylene.dark-molokai-theme
      
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "remote-ssh-edit";
        publisher = "ms-vscode-remote";
        version = "0.47.2";
        sha256 = "1hp6gjh4xp2m1xlm1jsdzxw9d8frkiidhph6nvl24d0h8z34w49g";
      }
    ]; 
  })
    
   ];

  # ssh
  programs.mtr.enable = true;
  programs.ssh.startAgent = true;
  services.openssh.enable = true;
  #DO NOT CHANGE THIS; PORFAVOR NOOOOO; NO LO MUEVAS; NO LO CAMBIES; NO HAY FORMA EN QUE PUEDA SALIR BIEN
  system.stateVersion = "25.11"; # Did you read the comment?

}
