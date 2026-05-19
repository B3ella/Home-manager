{inputs, pkgs, config, ...}:

{
  home.packages = [
    (pkgs.writeShellScriptBin "reloadi3" ''
      i3-msg reload
      i3-msg restart
    '')
    (pkgs.writeShellScriptBin "status_bar" ''
      while :
      do
	      echo $(myDate) " | " $(systemStatus) " | " $(batDir) $(myBattery) "| " $(myConnection) " | " $(facti)
	      sleep 5
      done
    '')
    (pkgs.writeShellScriptBin "myDate" ''
      date "+%a, %d, %H:%M"
    '')
    (pkgs.writeShellScriptBin "myBattery" ''
      acpi | cut -d' ' -f 4 | tr , " "
    '')
    (pkgs.writeShellScriptBin "batDir" ''
      acpi | cut -d' ' -f 3
    '')
    (pkgs.writeShellScriptBin "systemStatus" ''
      echo $(temp)c, $(myDisk), $(myMem)
    '')
    (pkgs.writeShellScriptBin "myConnection" ''
      nmcli g | sed -n '2 p' | cut -d' ' -f 1
    '')
    (pkgs.writeShellScriptBin "myDisk" ''
      dysk --color no -c free --csv | sed -n "2 p" | sed 's/,//g'
    '')
    (pkgs.writeShellScriptBin "myMem" ''
      free -h | grep Mem | cut -d' ' -f 19
    '')
    (pkgs.writeShellScriptBin "facti" ''
        echo "Bobo Cancun :3"
    '')
  ];
}
