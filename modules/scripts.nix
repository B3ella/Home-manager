{inputs, pkgs, ...}:

{
  home.packages = [
    (pkgs.writeShellScriptBin "update-site" ''
        cd ~/Desktop/projects/personal-website 
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
  ];
}
