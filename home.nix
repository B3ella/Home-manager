{ config, pkgs, ... }:

{ 
  imports = [
    ./modules/i3.nix
  ];

  home.username = "bella";
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
      reloadi3
    '')
  ];

  programs.kitty = {
    settings = {
      background_opacity = 0;
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
