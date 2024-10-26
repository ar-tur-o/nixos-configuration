{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    osu-lazer.enable = lib.mkEnableOption "enables osu! lazer";
  };

  config = lib.mkIf (config.osu-lazer.enable) {
    environment.systemPackages = [pkgs.osu-lazer-bin];
    hardware.opentabletdriver.enable = lib.mkDefault true;
  };
}
