# This module includes the ideal PC config.
# The hosts can disable/enable packages from there
{
  lib,
  config,
  ...
}: {
  imports = [
    # defaults on all system types
    ./default.nix
    # system
    ../system/boot/default.nix
    ../system/hardware/default.nix
    ../system/locale-and-time/default.nix
    ../system/network/default.nix
    ../system/sound/default.nix

    # programs
    ../programs/kitty/default.nix
    # stylix
    ../desktop-environment/stylix/default.nix
    # DE is not included cause' not all DEs work well on low power machines
  ];
}
