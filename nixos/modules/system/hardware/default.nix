{pkgs, ...}: {
  # enables opengl
  hardware.graphics.enable = true;

  services = {
    xserver = {
      xkb = {
        variant = "";
        layout = "us";
      };
    };

    # Enable CUPS to print documents.
    printing.enable = true;

    # Adds support for yubikey
    udev.packages = [
      pkgs.libfido2
    ];
  };
}
