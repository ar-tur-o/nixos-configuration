{lib, ...}: {
  imports = [
    # import programs here
    ../../modules/core
  ];

  home = {
    username = "sunshine-host";
    homeDirectory = lib.mkDefault "/home/sunshine-host";
  };

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
