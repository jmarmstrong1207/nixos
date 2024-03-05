{ config, pkgs, ... }:
{
 fileSystems."/mnt/intel" = {
   device = "/dev/disk/by-uuid/b980019b-eb37-46e7-8a2e-6ba10767422a";
   options = [
    "defaults"
    "x-gvfs-show"
    "nofail"
   ];
 };

 fileSystems."/mnt/extreme" = {
   device = "/dev/disk/by-uuid/4E21-0000";
   options = [
     "users"
     "nofail"
   ];
 };
}
