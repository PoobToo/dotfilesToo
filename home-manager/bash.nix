{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    bashrcExtra = "cat ~/.cache/wal/sequences";
  };
}

