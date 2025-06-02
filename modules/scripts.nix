{inputs, pkgs, ...}:

{
  home.packages = [
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
        cd ~/General/render
        s="$1.md"
        d="/home/bella/$1.pdf"
        echo $s
        echo $d
        md2pdf "$s" "$d"
    '')
  ];
}
