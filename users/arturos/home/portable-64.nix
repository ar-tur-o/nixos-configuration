{lib, ...}: {
  imports = let
    path = ../../modules/optional;
  in [
    ../../modules/core
    "${path}/browsers/firefox.nix"
    "${path}/util"
  ];
  home = {
    username = "arturos";
    homeDirectory = lib.mkDefault "/home/arturos";
  };

  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
}
