{inputs, pkgs, ...}:

{
  home.packages = [
    (pkgs.writeShellScriptBin "home-startup" ''
      set-bg
      daily-note
    '')
    (pkgs.writeShellScriptBin "set-bg" ''
      feh --bg-scale ~/.config/home-manager/imgs/bg.png
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
    (pkgs.writeShellScriptBin "render" ''
        cd ~/Notes
        s="$1.md"
        d="../Documents/$1.pdf"
        css="default.css"
        md2pdf "$s" "$d" --css=$css
    '')
    (pkgs.writeShellScriptBin "mount-usb" ''
        sudo mount /dev/sdb /home/bella/usb
    '')
    (pkgs.writeShellScriptBin "install-fonts" ''
        cp -r ~/.config/home-manager/fonts ~/.local/share/fonts
    '')
  ];
}
