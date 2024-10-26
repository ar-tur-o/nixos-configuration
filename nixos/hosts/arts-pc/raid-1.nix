{
  config,
  pkgs,
  ...
}: let
  conf-file = ''
    # This identifies the devices that will be used in arrays
    DEVICE /dev/sda1 /dev/sdb1 /dev/sdc1

    # This declares an array
    ARRAY /dev/md0 metadata=1.2 UUID=ff6afaf7:7b69cda9:061531eb:7ea34dbf name=raid-1 level=mirror num-devices=3

    # The following two lines are reqiured when you call `mdadm --monitor`
    MAILADDR toritosalgado90@gmail.com
    PROGRAM /usr/sbin/handle-mdadm-events
  '';
in {
  boot.swraid = {
    enable = true;
    mdadmConf = conf-file;
  };
  environment.etc = {"mdadm.conf".text = conf-file;};

  fileSystems."/mnt/raid-1" = {
    device = "/dev/disk/by-uuid/fb1b1ffb-8e0c-4b19-97c2-f18f61e66197";
    fsType = "ext4";
  };
}
