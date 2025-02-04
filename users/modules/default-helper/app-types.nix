{
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
      #fileArchive = strList;
      pdf = strList;
      image = strList;
      video = strList;
    };
  };

  config = lib.mkMerge [
    (let
      cfg = config.defaultApps;
      # this sets all mime types listed as having the default app "appName"
      # setApps (string) (listof: string)
      setMime = apps: (
        mimeTypes:
          lib.optionals (apps != [])
          (
            # map mime types to name-value pairs
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
        defaultApplications = builtins.listToAttrs (
          (setMime cfg.webBrowser [
            "text/html"
            "x-scheme-handler/http"
            "x-scheme-handler/https"
            "x-scheme-handler/about"
            "x-scheme-handler/unknown"
          ])
          ++ (setMime cfg.fileExplorer [
            "ionode/directory"
          ])
          #++ (setMime cfg.fileArchive [
          #  "application/zip"
          #  "application/x-gzip"
          #  "application/x-7z-compressed"
          #])
          ++ (setMime cfg.pdf ["application/pdf"])
          ++ (setMime cfg.image (builtins.map (x: "image/${x}") [
            "bmp"
            "gif"
            "jpeg"
            "jpg"
            "jxl"
            "pjpeg"
            "png"
            "tiff"
            "webp"
            "x-bmp"
            "x-gray"
            "x-icb"
            "x-ico"
            "x-png"
            "x-portable-anymap"
            "x-portable-bitmap"
            "x-portable-graymap"
            "x-portable-pixmap"
            "x-xbitmap"
            "x-xpixmap"
            "x-pcx"
            "svg+xml"
            "svg+xml-compressed"
            "vnd.wap.wbmp"
            "x-icns"
          ]))
          ++ (setMime cfg.video [
            "application/ogg"
            "application/x-ogg"
            "application/sdp"
            "application/smil"
            "application/x-smil"
            "application/streamingmedia"
            "application/x-streamingmedia"
            "application/vnd.rn-realmedia"
            "application/vnd.rn-realmedia-vbr"
            "audio/aac"
            "audio/x-aac"
            "audio/m4a"
            "audio/x-m4a"
            "audio/mp1"
            "audio/x-mp1"
            "audio/mp2"
            "audio/x-mp2"
            "audio/mp3"
            "audio/x-mp3"
            "audio/mpeg"
            "audio/x-mpeg"
            "audio/mpegurl"
            "audio/x-mpegurl"
            "audio/mpg"
            "audio/x-mpg"
            "audio/rn-mpeg"
            "audio/ogg"
            "audio/scpls"
            "audio/x-scpls"
            "audio/vnd.rn-realaudio"
            "audio/wav"
            "audio/x-pn-windows-pcm"
            "audio/x-realaudio"
            "audio/x-pn-realaudio"
            "audio/x-ms-wma"
            "audio/x-pls"
            "audio/x-wav"
            "video/mpeg"
            "video/x-mpeg"
            "video/x-mpeg2"
            "video/mp4"
            "video/msvideo"
            "video/x-msvideo"
            "video/ogg"
            "video/quicktime"
            "video/vnd.rn-realvideo"
            "video/x-ms-afs"
            "video/x-ms-asf"
            "video/x-ms-wmv"
            "video/x-ms-wmx"
            "video/x-ms-wvxvideo"
            "video/x-avi"
            "video/x-fli"
            "video/x-flv"
            "video/x-theora"
            "video/x-matroska"
            "video/webm"
            "audio/x-flac"
            "audio/x-vorbis+ogg"
            "video/x-ogm+ogg"
            "audio/x-shorten"
            "audio/x-ape"
            "audio/x-wavpack"
            "audio/x-tta"
            "audio/AMR"
            "audio/ac3"
            "video/mp2t"
            "audio/flac"
            "audio/mp4"
          ])
        );
      };
    })
  ];
}
