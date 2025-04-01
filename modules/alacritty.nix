{inputs, pkgs, ...}:

{
  programs.alacritty = {
    enable = true;
    settings = {
      font.normal = {
        family = "inconsolata";
      };
    };
  };
}
