{inputs, pkgs, ...}:

{
  programs.git = {
    enable = true;
    userName = "B3ella";
    userEmail = "goliveirapk@gmail.com";
    aliases = {
      gs = "!git status";
      gd = "!git diff";
      gds = "!git diff --staged";
      ga = "!git add";
      gap = "!git add -p";
      gcm = "!git commit -m";
      gc = "!git commit -am";
      gpush = "!git push";
      gp = "!git pull";
      gl = "!git log --one-line";
      gi = "!git init";
      gcl = "!git clone";
    };
    extraConfig = {
      core = {
        whitespace = "error";
        preloadindex = true;
      };
      url = {
        "git:@github.com:b3ella/" = {
          insteadOf = "b3:";
        };
        "git:@github.com:" = {
          insteadOf = "gh:";
        };
      };
      diff = {
        context = 3;
        renames = "copies";
      };
    };
  };
  programs.zsh.shellAliases = {
  };
}
