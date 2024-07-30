{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    ../../modules/default.nix
    inputs.nixvim.homeManagerModules.nixvim
  ];

  home = {
    username = "media";
    homeDirectory = lib.mkDefault "/home/media";

    sessionVariables = {
      EDITOR = "nvim";
      BROWSER = "firefox";
      TERMINAL = "kitty";
    };

    packages = with pkgs; [
      # Nemo file browser
      cinnamon.nemo-with-extensions

      # spell check
      hunspell
      hunspellDicts.en_US
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
