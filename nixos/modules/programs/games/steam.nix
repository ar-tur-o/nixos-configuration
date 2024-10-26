{
  lib,
  config,
  ...
}: {
  options = {
    steam.enable = lib.mkEnableOption "enables steam";
  };

  config = lib.mkIf (config.steam.enable) {
    # just in case
    hardware.steam-hardware.enable = true;

    programs.steam.enable = true;
  };
}
