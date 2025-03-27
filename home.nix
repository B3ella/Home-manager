{ config, pkgs, ... }:

{ home.username = "bella";
  home.homeDirectory = "/home/bella";


  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    (pkgs.writeShellScriptBin "gotonix" ''
      cd /etc/nixos
    '')
    (pkgs.writeShellScriptBin "editnix" ''
      cd /etc/nixos
      sudo nvim .
    '')
    (pkgs.writeShellScriptBin "gotohome" ''
      cd ~/.config/home-manager
    '')
    (pkgs.writeShellScriptBin "edithome" ''
      cd ~/.config/home-manager
      nvim .
    '')
    (pkgs.writeShellScriptBin "nrs" ''
      sudo nixos-rebuild switch
    '')
    (pkgs.writeShellScriptBin "nrb" ''
      sudo nixos-rebuild boot
      reboot
    '')
    (pkgs.writeShellScriptBin "hms" ''
      home-manager switch
    '')
  ];

  programs.kitty = {
    settings = {
      background_opacity = 0;
    };
  };

  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;
    config = {
      focus.followMouse = false;
      modifier = "Mod1";

      colors.focused = {
        background = "#263014";
        border = "#2f4704";
        childBorder = "#2f4704";
        indicator = "#2f4704";
        text = "#ffffff";

      };
      fonts = {
	names = ["Dalfitra"];
	style = "Regular";
	size = 15.0;
      };

      keybindings = {
        "Mod1+Return" = "exec kitty";
        "Mod1+q" = "kill";
        "Mod1+d" = "exec rofi -show drun -show-icons";
	"Mod1+g" = "exec firefox";
	"Mod1+o" = "exec obsidian";

        "Mod1+Left" = "focus left";
        "Mod1+Down" = "focus down";
        "Mod1+Up" = "focus up";
        "Mod1+Right" = "focus right";

        "Mod1+Shift+Left" = "move left";
        "Mod1+Shift+Down" = "move down";
        "Mod1+Shift+Up" = "move up";
        "Mod1+Shift+Right" = "move right";

        "Mod1+h" = "split h";
        "Mod1+v" = "split v";
        "Mod1+f" = "fullscreen toggle";

        "Mod1+s" = "layout stacking";
        "Mod1+w" = "layout tabbed";
        "Mod1+e" = "layout toggle split";

        "Mod1+Shift+space" = "floating toggle";
        "Mod1+space" = "focus mode_toggle";

        "Mod1+a" = "focus parent";

        "Mod1+Shift+minus" = "move scratchpad";
        "Mod1+minus" = "scratchpad show";

        "Mod1+1" = "workspace number 1";
        "Mod1+2" = "workspace number 2";
        "Mod1+3" = "workspace number 3";
        "Mod1+4" = "workspace number 4";
        "Mod1+5" = "workspace number 5";
        "Mod1+6" = "workspace number 6";
        "Mod1+7" = "workspace number 7";
        "Mod1+8" = "workspace number 8";
        "Mod1+9" = "workspace number 9";
        "Mod1+Tab" = "workspace number 10";


        "Mod1+Shift+1" =
          "move container to workspace number 1";
        "Mod1+Shift+2" =
          "move container to workspace number 2";
        "Mod1+Shift+3" =
          "move container to workspace number 3";
        "Mod1+Shift+4" =
          "move container to workspace number 4";
        "Mod1+Shift+5" =
          "move container to workspace number 5";
        "Mod1+Shift+6" =
          "move container to workspace number 6";
        "Mod1+Shift+7" =
          "move container to workspace number 7";
        "Mod1+Shift+8" =
          "move container to workspace number 8";
        "Mod1+Shift+9" =
          "move container to workspace number 9";
        "Mod1+Shift+0" =
          "move container to workspace number 10";

        "Mod1+p" = "exec scrot -s /home/bella/print.png";

        "Mod1+Shift+c" = "reload";
        "Mod1+Shift+r" = "restart";
        "Mod4+l" = "exec i3-msg exit";

        "Mod1+r" = "mode resize";
      };
      startup = [
        { command = "feh --bg-scale /home/bella/.wallpaper.png"; }
      ];

      gaps = {
        inner = 10;
        outer = 5;
      };
    };
  };
  
  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };
  #programs.neovim = 
  #let
  #  toLua = str: "lua << EOF\n${str}\nEOF\n";
  #  toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
  #in
  #{
  #  enable = true;
  #  defaultEditor = true; 
  #  extraLuaConfig = ''
  #    ${builtins.readFile ./nvim/options.lua}
  #  '';
  #  plugins = with pkgs.vimPlugins; [
  #    { plugin = telescope-nvim; config = toLuaFile ./nvim/plugin/telescope.lua;}
  #    { plugin = lsp-zero-nvim; config = toLuaFile ./nvim/plugin/lsp.lua;}
  #  ];
  #};

  #dont change
  home.stateVersion = "24.11"; # Please read the comment before changing.
  programs.home-manager.enable = true;
}
