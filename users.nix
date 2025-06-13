{ config, lib, pkgs, inputs, ... }:

{
  users.users.rd = {
    shell = pkgs.fish;
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "dialout" "networkmanager" "docker" ];
    packages = with pkgs; [
      firefox
      kitty

      git
      neovim
      ffmpeg
      brightnessctl
      playerctl
      grim
      slurp
      wl-clipboard
      unzip
      zip
      exiftool
      openssl
      btop

      wofi
      pavucontrol
      waybar
      mako

      clang
      clang-tools
      lld
      cmake
      gcc
      go
      gotools
      bun
      docker-compose
      postgresql
      delve
      cargo
      rustc
    ];
  };
}