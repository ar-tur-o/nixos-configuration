# Network related setttings.
{
  lib,
  host,
  ...
}: {
  networking.hostName = host.hostName;

  networking.networkmanager.enable = true;
}
