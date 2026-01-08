{
  description = "A simple NixOS flake";

  inputs = {
    # NixOS official package source, using the nixos-25.11 branch here
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    zapret-discord-youtube.url = "github:kartavkun/zapret-discord-youtube";
    home-manager = {
		url = "github:nix-community/home-manager";
		inputs.nixpkgs.follows = "nixpkgs";
    };   
  };

  outputs = { self, nixpkgs, home-manager, zapret-discord-youtube, ... }@inputs: {
    # Please replace my-nixos with your hostname
    nixosConfigurations.acertop = nixpkgs.lib.nixosSystem {
    	    system = "x86_64-linux";
	    modules = [	
              ./hosts/acertop/configuration.nix
	       zapret-discord-youtube.nixosModules.default {}
	       home-manager.nixosModules.home-manager
               {
           	 home-manager.useGlobalPkgs = true;
           	 home-manager.useUserPackages = true;

           	 # TODO replace ryan with your own username
           	 home-manager.users.river = import ./hosts/acertop/home-manager/home.nix;

           	 # Optionally, use home-manager.extraSpecialArgs to pass arguments to home.nix
               }	
	];
    };
  };
}
