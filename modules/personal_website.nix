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
  ];
}
