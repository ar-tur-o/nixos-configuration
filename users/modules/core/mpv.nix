{
  programs.mpv = {
    enable = true;
    config = {
      "keep-open" = true;
    };
  };

  xdg.mimeApps.defaultApplications = {
    "video/xms-video" = "mpv.desktop";
    "video/mp4" = "mpv.desktop";
    "video/mpeg" = "mpv.desktop";
    "video/ogv" = "mpv.desktop";
    "video/mp2t" = "mpv.desktop";
    "video/webm" = "mpv.desktop";
    "video/3gpp" = "mpv.desktop";
    "video/3gpp2" = "mpv.desktop";
  };
}
