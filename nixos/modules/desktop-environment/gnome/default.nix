{pkgs, ...}: {
  imports = [./network-displays.nix];

  services.xserver = {
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };
  environment.systemPackages = with pkgs; [
    gnome-tweaks

    # disabled for now because I can't figure out how to get it to work
    # (callPackage ./gnome-ext/hanabi.nix {}).hanabi
    # meson
    # ninja
    # glib # For post installation of Hanabi
  ];

  # remove all of the default apps
  documentation.nixos.enable = false;
  services.xserver.excludePackages = [pkgs.xterm];
  services.gnome.core-utilities.enable = false;
  environment.gnome.excludePackages = with pkgs; [
    gnome-photos
    gnome-tour
  ];
}
