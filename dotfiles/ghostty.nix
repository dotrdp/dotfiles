# this is running on home manager
{
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      font-family = "Maple Mono NF";
      font-feature = "liga, calt, dlig, keep-infinite-arrow=true";
      window-decoration = "false";
      command = "zsh";
      confirm-close-surface = "false";
      theme = "Kanagawa Wave";
      };
  };
}
