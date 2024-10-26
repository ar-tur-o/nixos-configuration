{
  pkgs,
  lib,
  ...
}: {
  # couldn't get it to work :/
  # environment.systemPackages = [pkgs.gnome-network-displays];
  # networking.firewall.allowedTCPPorts = [7236 7250];
  # networking.firewall.allowedUDPPorts = [7236 5353];
}
