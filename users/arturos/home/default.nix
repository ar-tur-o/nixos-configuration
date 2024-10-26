{lib, ...}: {
  imports = [
    # import programs here
    ../../modules/core
    ../../modules/optional
  ];

  home = {
    username = "arturos";
    homeDirectory = lib.mkDefault "/home/arturos";
  };

  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
}
