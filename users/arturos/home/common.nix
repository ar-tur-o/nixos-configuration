{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    # import programs here
    ./modules/default.nix
    ./default-apps.nix
  ];

  xdg.enable = true;
  xdg.mimeApps.defaultApplications = {
    "application/pdf" = ["firefox.desktop"];
    "text/html" = ["firefox.desktop"];
    "image" = ["qimgv.desktop"];
  };

  home = {
    username = "arturos";
    homeDirectory = lib.mkDefault "/home/arturos";

    sessionVariables = {
      EDITOR = "code --wait";
      BROWSER = "firefox";
      TERMINAL = "kitty";
      GDK_BACKEND = "wayland,x11";
      QT_QPA_PLATFORM = "wayland;xcb";
    };

    packages = with pkgs; [
      # spell check
      hunspell
      hunspellDicts.en_US

      # social
      spotify
      discord

      # creative suite
      # blender # blender was causing problems with python version mismatches
      krita
      inkscape
      ardour

      # qimgv for viewing images
      qimgv

      # office
      libreoffice

      # misc
      qbittorrent-qt5
      insync
      google-chrome
    ];
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
