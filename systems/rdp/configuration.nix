# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{inputs, config, lib, pkgs, ... }:
let
  niri-package = inputs.niri-override.packages.${pkgs.system}.niri;
in
{
  imports =
    [ 
      inputs.apple-silicon-support.nixosModules.apple-silicon-support
      ../../pkg-bundles/nvim.nix
      ../../pkg-bundles/de.nix
      ../../pkg-bundles/utils.nix
      ../../pkg-bundles/orgmode.nix
      ./sys-specific
	
    ];
  #HARDWARE  
  #
  hardware.asahi.peripheralFirmwareDirectory = ./firmware;
  hardware.keyboard.qmk.enable = true;
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = false;

  #FLAKE
  nix.settings.experimental-features = [ "flakes" "nix-command" ];
  services.xserver.xkb.layout = "es";
  services.printing.enable = true;
  services.pipewire = {
     enable = true;
     pulse.enable = true;
   };
 
  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  users.users.rd = {
     isNormalUser = true;
     extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
     packages = with pkgs; [
       tree
     ];
     
   };
  
    #packages
  fonts.packages = with pkgs; [
    maple-mono.NF-unhinted
  ];

  programs.firefox.enable = true;
 
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
	lua-language-server
  ];
  environment.variables = {
  	EDITOR = "nvim";
  };
# NOTE: [INFO] SYSTEM PACKAGES
  environment.systemPackages = 
# let exportingpythonldlibrary = with pkgs; stdenv.mkDerivation rec {
#     name = "exportingpythonldlibrary";
#     nativeBuildInputs = [
# 	pkgs.stdenv.cc.cc
# ];
# # 	postInstall = ''
# #     # export LD_LIBRARY_PATH=$(nix eval --raw nixpkgs.stdenv.cc.cc)/lib:$LD_LIBRARY_PATH
# #     export LD_LIBRARY_PATH="${ pkgs.lib.makeLibraryPath [ pkgs.stdenv.cc.cc ]}:$LD_LIBRARY_PATH"
# # '';
# 	shellHook = ''
#     # export LD_LIBRARY_PATH=$(nix eval --raw nixpkgs.stdenv.cc.cc)/lib:$LD_LIBRARY_PATH
#     export LD_LIBRARY_PATH="${ pkgs.lib.makeLibraryPath [ pkgs.stdenv.cc.cc ]}:$LD_LIBRARY_PATH"
# '';
# };
# in
[
     #
     pkgs.mako
     pkgs.waybar
     pkgs.fuzzel
 





     pkgs.vivaldi
     pkgs.vivaldi-ffmpeg-codecs
     pkgs.typst

     pkgs.asahi-bless
     pkgs.mesa
     pkgs.python313Packages.mutagen
     # exportingpythonldlibrary

     pkgs.direnv
     pkgs.rose-pine-cursor

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

