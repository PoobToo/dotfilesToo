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
      EDITOR = "vim";
      XCUSRSOR_SIZE = 36;
    };
  };

  programs.home-manager.enable = true;
}
