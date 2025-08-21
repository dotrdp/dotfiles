# this is running at home-manager level
{ config, pkgs, lib, ... }:
{
	programs.zsh = {
	  enable = true;
	  syntaxHighlighting.enable = true;
	  autosuggestion.enable = true;
	  initContent = "eval \"$(direnv hook zsh)\" && eval \"$(nix eval --raw nixpkgs.stdenv.cc.cc.lib)\" && export MPD_HOST=$XDG_RUNTIME_DIR/mpd/socket && clear && nitch";
	  shellAliases = {
		nvimc = "ghostty -e nvim .";
		storage = "nix-shell -p ncdu --command 'ncdu /'";
		macos = "sudo asahi-bless --next --set-boot-macos -y && reboot";
	  };
	  zplug = {
	    enable = true;
	    plugins = [
	      { name = "marlonrichert/zsh-autocomplete"; } 
	      # { name = "zsh-users/zsh-autosuggestions"; }
	      { name = "chisui/zsh-nix-shell"; }
	      { name = "MichaelAquilina/zsh-you-should-use"; }
	      { name = "atuinsh/atuin"; }
	    ];
	  };
	  oh-my-zsh = {
	    enable = true;
	    plugins = [
	      "git"
	    ];
	  };
	};
	programs.command-not-found.enable = true;
	programs.direnv = {
	  enable = true;
	  nix-direnv.enable = true;
	};
	programs.atuin = {
	  enable = true;
	};
}
