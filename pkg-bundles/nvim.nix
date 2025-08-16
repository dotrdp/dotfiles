{pkgs, lib, config, ...}:
{
environment.systemPackages = with pkgs; [
     neovim
     gcc
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
     nodejs_20
     playerctl
];
}
