{
  description = "My nixos flake.";

  inputs = {
    # official nix source
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # home manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Firefox Addons
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Nixos Hardware
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    # Stylix
    stylix.url = "github:danth/stylix";

    # Hyprland
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    # VSCode extensions
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
  };

  outputs = {self, ...} @ inputs: let
    systems = [
      "aarch64-linux" # 64 bit arm
      "i686-linux" # 32 bit x86
      "x86_64-linux" # 64 bit x86
      # no darwin (apple) archetetures, I'm too broke for that.
    ];
    forAllSystems = inputs.nixpkgs.lib.genAttrs systems;
  in {
    # Formatter for your nix files, available through 'nix fmt'
    # Other options beside 'alejandra' include 'nixpkgs-fmt'
    formatter = forAllSystems (system: inputs.nixpkgs.legacyPackages.${system}.alejandra);

    nixosConfigurations = let
      hosts = [
        {
          hostName = "arts-pc";
          system = "x86_64-linux";
          users = ["arturos"];
        }
        {
          hostName = "t480s";
          system = "x86_64-linux";
          users = ["arturos"];
        }
      ];
    in
      builtins.listToAttrs (builtins.map (host: {
          name = host.hostName;
          value = inputs.nixpkgs.lib.nixosSystem {
            specialArgs = {
              inherit inputs;
              inherit host;
            };
            modules = [
              ./nixos/hosts/${host.hostName}/configuration.nix

              inputs.home-manager.nixosModules.home-manager
              {
                home-manager = {
                  extraSpecialArgs = {
                    inherit inputs;
                    inherit host;
                  };

                  useGlobalPkgs = true;
                  useUserPackages = true;
                  users =
                    builtins.listToAttrs
                    (builtins.map
                      (user: {
                        name = user;
                        value = import (
                          if builtins.pathExists ./users/${user}/home/${host.hostName}.nix
                          then ./users/${user}/home/${host.hostName}.nix
                          else ./users/${user}/home/common.nix
                        );
                      })
                      host.users);
                };
              }
            ];
          };
        })
        hosts);
  };
}
