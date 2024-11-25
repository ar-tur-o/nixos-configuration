# Network related settings.
{host, ...}: {
  networking.hostName = host.hostName;

  networking.networkmanager.enable = true;
  networking.wireless.enable = false;
}
