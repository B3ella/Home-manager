{ config, nix-colors, pkgs, ... }:

{ 
  imports = [
    ./modules/i3.nix
    ./modules/alacritty.nix
    ./modules/neovim.nix
    ./modules/zsh.nix
    ./modules/personal_website.nix
    nix-colors.homeManagerModules.default
  ];
  colorScheme = nix-colors.colorSchemes.kanagawa;

  programs.nvf.enableManpages = true;

  home.username = "bella";
  home.homeDirectory = "/home/bella";

  programs.git.userEmail = "goliveirapk@gmail.com";
  programs.git.userName = "Isabella";


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
  
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  #dont change
  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
