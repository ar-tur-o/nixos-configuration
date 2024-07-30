{pkgs, ...}: {
  home.packages = with pkgs; [
    cinnamon.nemo-with-extensions
  ];
  xdg.mimeApps.defaultApplications."inode/directory" = "nemo.desktop";
}
