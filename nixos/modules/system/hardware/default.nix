{pkgs, ...}: {
  # enables opengl
  hardware.graphics.enable = true;

  services.blueman.enable = true;
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    input = {
      General = {
        ClassicBondedOnly = false;
      };
    };
  };

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
