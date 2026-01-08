{
  description = "A simple NixOS flake";

  inputs = {
    # NixOS official package source, using the nixos-25.11 branch here
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    zapret-discord-youtube.url = "github:kartavkun/zapret-discord-youtube";
   
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    # Please replace my-nixos with your hostname
    nixosConfigurations.acertop = nixpkgs.lib.nixosSystem {
    	    system = "x86_64-linux";
	    modules = [	
              ./hosts/acertop/configuration.nix
	    ];
	};
  };
}
