{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    moonlight = {
      enable = lib.mkEnableOption "enables moonlight";
      isEmbedded = lib.mkEnableOption "if enabled, uses the version of moonlight for embedded systems (pkgs.moonlight-embedded).";
    };
  };

  config = lib.mkIf (config.moonlight.enable) {
    environment.systemPackages = with pkgs; [
      (
        if config.moonlight.isEmbedded
        then moonlight-qt
        else moonlight-embedded
      )
    ];
  };
}
