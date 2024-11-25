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

    nixvim = {
      url = "github:nix-community/nixvim";
      # If you are not running an unstable channel of nixpkgs, select the corresponding branch of nixvim.
      # url = "github:nix-community/nixvim/nixos-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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
        {
          hostName = "portable-64";
          system = "x84_64-linux";
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
              # import the host
              ./nixos/hosts/${host.hostName}/configuration.nix

              # import each user home module
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
                          else ./users/${user}/home/default.nix
                        );
                      })
                      host.users);
                };
              }
            ] 
            # import all user definitions
            ++ map (user: ./users/${user}/user.nix) host.users;
          };
        })
        hosts);
  };
}
