{
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
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = false;
  swapDevices = [{
    device = "/swapfile";
    size = 16 * 1024; # 16GB
  }];
  zramSwap.enable = true;

}
