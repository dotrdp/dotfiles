{pkgs, lib, config, ...}:
{
environment.systemPackages = with pkgs; [
     neovim
     gcc
     just
     ripgrep
     fd
     wl-clipboard
     xclip
     gnumake42
     vimPlugins.lazydev-nvim
     nil
     stylua
     luajitPackages.luacheck
     lazygit
     cava
     ghostscript
     nodejs_20
     playerctl
     imagemagick
];
}
