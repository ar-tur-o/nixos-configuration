# Documentation at:
# https://nix-community.github.io/home-manager/options.xhtml#opt-programs.firefox.enable
{lib, ...}: {
  programs.firefox = {
    enable = lib.mkDefault true;

    profiles = {
      "Arturo Salgado" = {
        # no more extensions because they were buggy and inconvenient.

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
  home.sessionVariables = {
    BROWSER = "firefox";
  };
}
