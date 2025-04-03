{ config, pkgs, ... }:
{
 fileSystems."/mnt/230gb-ssd" = {
   device = "/dev/disk/by-uuid/F69692379691F877";
   #fsType = "ntfs-3g";
   options = [
    "defaults"
    "x-gvfs-show"
    "nofail"
    "uid=1000"
   ];
 };

 fileSystems."/mnt/small-ssd" = {
   device = "/dev/disk/by-uuid/9C58C02158BFF7DA";
   options = [
    "defaults"
    "x-gvfs-show"
    "nofail"
    "uid=1000"
   ];
 };

 fileSystems."/mnt/150gb-ssd" = {
   device = "/dev/disk/by-uuid/1d9d4be3-1994-4a94-84af-e257742fb5ef";
   options = [
    "defaults"
    "x-gvfs-show"
    "nofail"
   ];
 };
}
