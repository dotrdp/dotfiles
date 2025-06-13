{ config, lib, pkgs, inputs, ... }:

{
  networking.hostName = "nixos";

  networking.networkmanager.enable = true;
}