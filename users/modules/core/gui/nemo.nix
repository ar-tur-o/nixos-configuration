{pkgs, ...}: {
  home.packages = with pkgs; [
    nemo-with-extensions
  ];
  xdg.mimeApps.defaultApplications."inode/directory" = "nemo.desktop";
}
