{pkgs, lib, ...}:
{
	environment.systemPackages = with pkgs; [
		# Utilities
		btop
		wget
		git
		nitch
		gh
		gh-copilot
		tlrc
		ffmpeg-full
		yt-dlp
		fastfetch


		# Networking tools
		net-tools

		unzip

	];
}

