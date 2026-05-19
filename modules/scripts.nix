{inputs, pkgs, ...}:

{
  home.packages = [
    (pkgs.writeShellScriptBin "home-startup" ''
      set-bg
    '')
    (pkgs.writeShellScriptBin "notes" ''
      cd ~/Notes
      nvim daily-note.md
    '')
    (pkgs.writeShellScriptBin "status_background" ''
      set-bg
    '')
    (pkgs.writeShellScriptBin "set-bg" ''
      feh --bg-scale ~/.config/home-manager/imgs/bg.png
    '')
    (pkgs.writeShellScriptBin "change-bg-2" ''
      feh --bg-scale ~/Photos/lain_bg_2.jpg
      ~/Photos/lain_bg_2.jpg
    '')
    (pkgs.writeShellScriptBin "change-bg" ''
      feh --bg-scale ~/.config/home-manager/imgs/about-time.png
    '')
    (pkgs.writeShellScriptBin "daily-note" ''
      cd ~/Projects/daily-note
      ./templater
    '')
    (pkgs.writeShellScriptBin "update-site" ''
        cd ~/Projects/personal-website 
        python3 cms.py
        git reset
        git add src/components/projects.astro
        git commit -m "chores: update files"
    '')
    (pkgs.writeShellScriptBin "update-cv" ''
        cd ~/General/2\ -\ Area/Professional/CV/
        md2pdf curriculo.md curriculo.pdf
    '')
    (pkgs.writeShellScriptBin "update-spending_log" ''
        cd ~/Desktop/projects/spending_log
        python3 main.py 5
    '')
    (pkgs.writeShellScriptBin "mount-usb" ''
        sudo mount /dev/sdb /home/bella/usb
    '')
    (pkgs.writeShellScriptBin "install-fonts" ''
        cp -r ~/.config/home-manager/fonts ~/.local/share/fonts
    '')
  ];
}
