{
  networking.interfaces.enp4s0.wakeOnLan = {
    enable = true;
    policy = ["magic"];
  };

  users.users.sunshine-host = {
    isNormalUser = true;
    description = "Sunshine Host";
    extraGroups = ["networkmanager" "audio"];
  };
}
