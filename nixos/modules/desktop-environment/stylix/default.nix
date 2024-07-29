{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    # import stylix
    inputs.stylix.nixosModules.stylix
  ];

  stylix = {
    enable = true;

    # This is the full list of themes
    # https://github.com/tinted-theming/schemes/tree/spec-0.11/base16
    base16Scheme = let
      fileName = "catppuccin-frappe.yaml";
    in "${pkgs.base16-schemes}/share/themes/${fileName}";

    polarity = "dark";

    opacity = {
      terminal = 0.75;
      popups = 0.90;
    };

    image = ./wallpaper.png;

    cursor.package = pkgs.bibata-cursors;
    cursor.name = "Bibata-Modern-Ice";
  };
}
