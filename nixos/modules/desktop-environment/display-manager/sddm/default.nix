{pkgs, ...}: let
  theme = import ./sddm-themes/sugar-dark.nix;
in {
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.displayManager.sddm.theme = "${theme.package {
    inherit pkgs;
    image = ../../stylix/wallpaper.png; # just yoink the wallpaper from stylix
  }}";
  environment.systemPackages = theme.dependencies {inherit pkgs;};
}
