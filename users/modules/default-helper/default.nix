{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    defaultApps = let
      types = lib.types;
      strList = lib.mkOption {
        type = types.listOf types.str;
        default = [];
      };
    in {
      webBrowser = strList;
      fileExplorer = strList;
      pdf = strList;
    };
  };

  config = let
    cfg = config.defaultApps;
    # this sets all mime types listed as having the default app "appName"
    # setApps (string) (listof: string)
    setMime = apps: (
      mimeTypes:
      # only make the list if the apps list isn't empty
        lib.mkIf (apps != [])
        (
          builtins.listToAttrs
          (builtins.map (mimeType: {
              name = mimeType;
              value = builtins.map (app: "${app}.desktop") apps;
            })
            mimeTypes)
        )
    );
  in {
    xdg.mimeApps = {
      enable = true;
      defaultApplications = (
        setMime cfg.webBrowser [
          "text/html"
          "x-scheme-handler/http"
          "x-scheme-handler/https"
          "x-scheme-handler/about"
          "x-scheme-handler/unknown"
        ] //
        setMime cfg.fileExplorer ["ionode/directory"] //
        setMime cfg.pdf ["application/pdf"]
     );
    };
  };
}
