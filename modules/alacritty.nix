{inputs, pkgs, ...}:

{
  programs.alacritty = {
    enable = true;
    settings = {
      font.normal = {
      family = "NeverMindRoundedMono";
      opacity = 0.7;
      };
    };
  };
}
