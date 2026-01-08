{
  description = "A simple NixOS flake";

  inputs = {
    # NixOS official package source, using the nixos-25.11 branch here
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    # Please replace my-nixos with your hostname
    nixosConfigurations.acertop = nixpkgs.lib.nixosSystem {
	    modules = [
	      (
	        { pkgs, ... }:
	        {
	          nixpkgs.overlays = [
	            # Alternatively: use the exact kernel versions as defined in this repo.
	            # Guarantees you have binary cache.
	            self.overlays.pinned

	            # Only use one of the two overlays!
	          ];
		  ./hosts/acertop/configuration.nix
	        }
	      )
	    ];
	};
  };
}
