{ config, pkgs, ... }: {
  	imports = [
    		./modules/bundle.nix
  	];
	home = {
		username = "river";
		homeDirectory = "/home/river";
		stateVersion = "25.11";



	};
}
