{ pkgs, ... }:
let
  gtk-theme = "adw-gtk3-dark";

  nerdfonts = (pkgs.nerdfonts.override {
    fonts = [
      "JetBrainsMono"
      "IntelOneMono"
    ];
  });

  cursor-theme = "Bibata-Original-Classic";
  cursor-package = pkgs.bibata-cursors;
in
{
  home = {
    packages = with pkgs; [
      adw-gtk3
      font-awesome
      nerdfonts
    ];
    sessionVariables = {
      XCURSOR_THEME = cursor-theme;
      XCURSOR_SIZE = "24";
    };
    pointerCursor = {
      package = cursor-package;
      name = cursor-theme;
      size = 24;
      gtk.enable = true;
    };
    #  file = {
    #    ".config/gtk-4.0/gtk.css" = {
    #      text = ''
    #        window.messagedialog .response-area > button,
    #        window.dialog.message .dialog-action-area > button,
    #        .background.csd{
    #          border-radius: 0;
    #        }
    #      '';
    #    };
    #  };
  };

  fonts.fontconfig.enable = true;

  gtk = {
    enable = true;
    font.name = "JetBrainsMono";
    theme.name = gtk-theme;
    cursorTheme = {
      name = cursor-theme;
      package = cursor-package;
    };
  };

  qt = {
    enable = true;
    platformTheme = "kde";
  };
}
