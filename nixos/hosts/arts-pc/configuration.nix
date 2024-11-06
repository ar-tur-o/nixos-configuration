{
  config,
  inputs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    # Include the PC archetype and desktop environment
    ../../modules/archetypes-common/personal-computer.nix
    ../../modules/desktop-environment/gnome/default.nix
    # Also games :)
    ../../modules/programs/games/default.nix

    # Add users
    ../../../users/arturos/user.nix
    ../../../users/sunshine-host/user.nix

    # Raid config
    # ./raid-1.nix
  ];

  services.flatpak.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
