# Documentation at:
# https://nix-community.github.io/home-manager/options.xhtml#opt-programs.firefox.enable
{
  config,
  pkgs,
  inputs,
  ...
}: {
  programs.firefox = {
    enable = true;

    profiles = {
      "Arturo Salgado" = {
        # firefox addons are stored on the Nix user repo
        extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
          bitwarden
          ublock-origin
          clearurls
          return-youtube-dislikes
        ];
        settings = {
          "extensions.autoDisableScopes" = 0; # this allows for extensions to be auto-enabled
        };
      };
    };

    # ========== POLICIES ========== #
    # Check about:policies#documentation for options.
    policies = {
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
        EmailTracking = true;
      };

      SearchBar = "unified";
      NoDefaultBookmarks = true;
      PasswordManagerEnabled = true;
      StartDownloadsInTempDirectory = true;

      # Firefox Suggest is the suggestions that appear when typing in the search bar.
      FirefoxSuggest = {
        WebSuggestions = true;
        SponsoredSuggestions = false;
        ImproveSuggest = false;
        Locked = true;
      };

      FirefoxHome = {
        Search = true;
        TopSites = false;
        SponsoredTopSites = false;
        Highlights = false;
        Pocket = false;
        SponsoredPocket = false;
        Snippets = false;
        Locked = true;
      };

      DisplayBookmarksToolbar = "always";
      DisableTelemetry = true;
      DisablePocket = true;
      DisableFormHistory = true;
      DisableFirefoxStudies = true;

      AutofillCreditCardEnabled = false;
      AutofillAddressEnabled = false;
    };
  };
}
