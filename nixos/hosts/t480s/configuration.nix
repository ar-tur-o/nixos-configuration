{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    # Include the PC archetype and desktop environment
    ../../modules/archetypes-common/personal-computer.nix
    ../../modules/desktop-environment/gnome/default.nix

    # only import moonlight for gamestreaming and steam for small games
    ../../modules/programs/games/moonlight.nix
    ../../modules/programs/games/steam.nix

    # Add users
    ../../../users/arturos/user.nix
  ];

  # enable steam and moonlight
  moonlight.enable = true;
  steam.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
