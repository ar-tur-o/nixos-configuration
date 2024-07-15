{
  pkgs,
  lib,
  config,
  ...
}: {
  imports = [
    ./osu-lazer.nix
    ./steam.nix
    ./moonlight.nix
    ./sunshine.nix
  ];

  osu-lazer.enable = lib.mkDefault true;
  steam.enable = lib.mkDefault true;
  moonlight.enable = lib.mkDefault true;
  sunshine.enable = lib.mkDefault true;
}
