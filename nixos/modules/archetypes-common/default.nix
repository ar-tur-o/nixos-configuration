# This module includes the bare minimum config
{
  config,
  pkgs,
  lib,
  ...
}: {
  options = {
    home-manager.enable = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Enables home manager (true by default)";
    };
  };

  config = {
    nix.settings.experimental-features = ["nix-command" "flakes"]; # enables flakes :)
    services.xserver.enable = lib.mkDefault true;
    nixpkgs.config.allowUnfree = true;
    environment.systemPackages = lib.optionals (config.home-manager.enable) [
      pkgs.home-manager
    ];
  };
}
