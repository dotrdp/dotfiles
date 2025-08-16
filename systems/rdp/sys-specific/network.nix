{
  networking.hostName = "rdp";
  networking.wireless.iwd = {
  enable = true;
  settings.General.EnableNetworkConfiguration = true;
  };
  time.timeZone = "America/Mexico_City";
  i18n.defaultLocale = "en_US.UTF-8";
}
