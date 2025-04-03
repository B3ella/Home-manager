{ pkgs, libs, ... }:

{
  programs.nvf.enable = true;
  programs.nvf.settings.vim = {
    globals.mapleader = " ";

    theme = {
      enable = true;
      name = "gruvbox";
      style = "dark";
    };

    options = {
      wrap = false;
      tabstop = 2;
    };

    viAlias = true;
    vimAlias = true;

    telescope.enable = true;
    telescope.mappings.findFiles = "<leader>pf";
    navigation.harpoon.enable = true;

    lsp = {
      enable = true;
    };
    languages = {
      rust.enable = true;
      nix.enable = true;
      ts.enable = true;
      python.enable = true;
      markdown.enable = true;
    };
    keymaps = [
      {
        key = "<leader>pv";
        mode = "n";
        silent = true;
        action = ":Ex<Enter>";
      }
    ];
  };
}
