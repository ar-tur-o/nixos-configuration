{
  pkgs,
  stdenv,
  fetchFromGitHub,
}: {
  hanabi = stdenv.mkDerivation rec {
    pname = "gnome-ext-hanabi";
    version = "";
    dontBuild = false;
    nativeBuildInputs = with pkgs; [
      meson
      ninja
      glib
      nodejs
      wrapGAppsHook4
      appstream-glib
      gobject-introspection
      #      makeWrapper
      #      pkg-config
      shared-mime-info
    ];

    buildInputs = with pkgs; [
      # Video/Audio data composition framework tools like "gst-inspect", "gst-launch" ...
      gst_all_1.gstreamer
      # Common plugins like "filesrc" to combine within e.g. gst-launch
      gst_all_1.gst-plugins-base
      # Specialized plugins separated by quality
      gst_all_1.gst-plugins-good
      gst_all_1.gst-plugins-bad
      gst_all_1.gst-plugins-ugly
      # Plugins to reuse ffmpeg to play almost every video format
      gst_all_1.gst-libav
      # Support the Video Audio (Hardware) Acceleration API
      gst_all_1.gst-vaapi
      #    gst_all_1.gst-plugins-rs
      clapper
      gjs
      gtk4
      #    libadwaita
      #    libGL
      #    libsoup
      wayland
      wayland-protocols
    ];
    dontWrapGApps = true;

    #    installPhase = ''
    #      cp -r $out/share/gsettings-schemas/gnome-extension-hanabi-/glib-2.0 $out/share/glib-2.0
    #    '';

    postPatch = ''
      patchShebangs build-aux/meson-postinstall.sh
    '';

    #    postInstall = ''
    #      mv "$out/share/glib-2.0/schemas" "$out/share/gnome-shell/extensions/hanabi-extension@jeffshee.github.io/schemas"
    #    '';

    postFixup = ''
      wrapGApp "$out/share/gnome-shell/extensions/hanabi-extension@jeffshee.github.io/renderer/renderer.js"
      ln -s "$out/share/gsettings-schemas/gnome-ext-hanabi-/glib-2.0/schemas" "$out/share/gnome-shell/extensions/hanabi-extension@jeffshee.github.io/schemas"

    '';

    src = fetchFromGitHub {
      owner = "jeffshee";
      repo = "gnome-ext-hanabi";
      rev = "39c23784c5211aaa0d7917072433496b259445b0";
      sha256 = "sha256-NX9BflcBdgZKTS9azfuyttnU7PPvolGvUMDFK5XXgKo=";
    };
  };
}
#git ls-remote https://github.com/jeffshee/gnome-ext-hanabi for rev

