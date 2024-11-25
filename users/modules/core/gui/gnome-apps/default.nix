{pkgs, ...}: {
  # I might split these into separate files, but because they are core apps I
  # always want these apps with me on all gui systems, so it makes no difference
  home.packages = with pkgs; [
    nemo-with-extensions # file explorer
    totem # view video files
    eog # view image files
    evince # view documents like pdf
    cheese # take photos with webcam
    gnome-clocks # clock app
    gnome-calendar # calendar app
    gnome-calculator # calculator app
    gnome-disk-utility # manage disks and partitions
    eyedropper # eyedropper app
  ];
  xdg.mimeApps.defaultApplications."inode/directory" = "nemo.desktop";
}
