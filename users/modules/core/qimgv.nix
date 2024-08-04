{pkgs, ...}: {
  home.packages = with pkgs; [qimgv];
  xdg.mimeApps.defaultApplications = builtins.listToAttrs (map (t: {
      name = t;
      value = "qimgv.desktop";
    }) [
      "apng"
      "avif"
      "bmp"
      "gif"
      "vnd.microsoft.icon"
      "jpeg"
      "png"
      "svg+xml"
      "tiff"
      "webp"
    ]);
}
