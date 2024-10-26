{
  pkgs,
  inputs,
  host,
  ...
}: {
  imports = [
    ../display-manager/sddm/default.nix
  ];

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages."${host.system}".hyprland;
    xwayland.enable = true;
  };

  environment = {
    # hint electron apps to use wayland:
    sessionVariables.NIXOS_OZONE_WL = "1";
    systemPackages = with pkgs; [
      # wayland bar
      waybar

      # notification daemon
      dunst
      libnotify

      # wallpaper daemon
      swww

      # app launcher
      rofi-wayland
    ];
  };

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];
}
