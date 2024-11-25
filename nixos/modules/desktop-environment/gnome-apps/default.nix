{
  pkgs,
  lib,
  ...
}: {
  # the actual apps are installed per user but they all need dconf and the icon themes
  programs.dconf.enable = lib.mkDefault true;
  environment.systemPackages = with pkgs; [
    adwaita-icon-theme
    morewaita-icon-theme # more icons for apps and such
  ];
}
