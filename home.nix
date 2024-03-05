{ config, pkgs, inputs, ... }:

{
  imports = [
    ./home-manager/hyrland.nix
    ./home-manager/theme.nix
    ./home-manager/waybar/waybar.nix
    ./home-manager/foot.nix
  ];

  home = {
    username = "leo";
    homeDirectory = "/home/leo/";
    stateVersion = "23.11";
    packages = [ ];

  };
  programs.home-manager.enable = true;
}
