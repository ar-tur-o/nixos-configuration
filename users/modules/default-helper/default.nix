{
  imports = [
    ./app-types.nix
  ];

  defaultApps = {
    webBrowser = ["firefox" "google-chrome"];
    fileExplorer = ["nemo"];
    #fileArchive = ["nemo-fileroller"];
    pdf = ["org.gnome.Evince"];
    image = ["org.gnome.eog"];
    video = ["org.gnome.Video"];
  };
}
