{ config, pkgs, inputs, ... }:

{
  imports = [
    ./home-manager/hyrland.nix

  ];

  home = {
    username = "leo";
    homeDirectory = "/home/leo/";
    stateVersion = "23.11";
    packages = [ ];
    sessionVariables = {
      EDITOR = "nvim";
      XCUSRSOR_SIZE = 36;
    };
    pointerCursor = {
      gtk.enable = true;
      x11.enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Original-Classic";
      size = 28;
    };
  };

  programs.home-manager.enable = true;
}
