{
programs.clock-rs = {
  enable = true;

  settings = {
    general = {
      color = "red";
      interval = 250;
      blink = false;
      bold = true;
    };

    position = {
      horizontal = "center";
      vertical = "center";
    };

    date = {
      fmt = "%I:%M:%S %p";
      use_12h = true;
      hide_seconds = false;
    };
  };
};
}
