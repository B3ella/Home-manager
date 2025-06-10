{inputs, pkgs, ...}:

{
  programs.qutebrowser = {
    enable = true;
    keyBindings = {
      normal = {
        "<Ctrl+p>" = "open -t https://keepersecurity.com/vault/";
      };
    };
  };
}
