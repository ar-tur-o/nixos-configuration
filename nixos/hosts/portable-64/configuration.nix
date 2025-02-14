{
  modulesPath,
  host,
  lib,
  ...
}: {
  imports = [
    # Include the PC archetype and desktop environment
    ../../modules/archetypes-common/personal-computer.nix
    ../../modules/desktop-environment/hyprland/default.nix

    # iso module
    "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"
  ];

  nixpkgs.hostPlatform = host.system;
  nixpkgs.config.allowUnfree = true;

  # the build was complaining about this
  programs.ssh.setXAuthLocation = lib.mkForce true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
