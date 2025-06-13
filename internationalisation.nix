{ pkgs, ... }:

{
  i18n.supportedLocales = [
    "en_US.UTF-8/UTF-8"
    "uk_UA.UTF-8/UTF-8"
    "ru_RU.UTF-8/UTF-8"
  ];
  
  i18n.defaultLocale = "en_US.UTF-8";

  services.xserver = {
    xkb.layout = "es";
  };

  time.timeZone = "America/Mexico_City";

  
}