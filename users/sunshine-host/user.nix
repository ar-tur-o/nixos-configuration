{
  networking.interfaces.enp4s0.wakeOnLan = {
    enable = true;
    policy = ["magic"];
  };

  systemd.user.services.sunshine-host = {
    enable = true;
    description = "sets up gaming stuff";
    serviceConfig.PassEnvironment = "DISPLAY";
    script = ''
      sunshine
      steam
    '';
    wantedBy = ["default.target"];
  };

  users.users.sunshine-host = {
    isNormalUser = true;
    description = "Sunshine Host";
    extraGroups = ["networkmanager" "audio"];
  };
}
