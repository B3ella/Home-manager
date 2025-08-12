{inputs, pkgs, ...}:

{
  programs.qutebrowser = {
    enable = true;
    keyBindings = {
      normal = {
        "<Ctrl+w>" = "open -t https://web.whatsapp.com/";
        "<Ctrl+e>" = "open -t https://ea.uniceub.br/Sistema/Acesso/Login";
        "<Ctrl+g>" = "open -t https://github.com/B3ella";
        "<Ctrl+m>" = "open -t https://mail.google.com/mail/u/0/#inbox";
      };
    };
  };
}
