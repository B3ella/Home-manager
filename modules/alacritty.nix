{inputs, pkgs, ...}:

{
  programs.alacritty = {
    enable = true;
    settings = {
      font.normal = {
        family = "NeverMindRoundedMono";
      };
      window.opacity = 0.9;
    };
  };
}
