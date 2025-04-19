{inputs, pkgs, ...}:

{
  home.packages = [
    (pkgs.writeShellScriptBin "reloadi3" ''
      i3-msg reload
      i3-msg restart
    '')
    (pkgs.writeShellScriptBin "status_bar" ''
      while :
      do
	echo $(myDate) " | " $(systemStatus) " | " $(myBattery) " | " $(myConnection) " | " $(junipeiro_tree)
	sleep 5
      done
    '')
    (pkgs.writeShellScriptBin "myDate" ''
      date -R | cut -d'-' -f 1
    '')
    (pkgs.writeShellScriptBin "myBattery" ''
      echo $(echo -e "\U1F50B") $(battery | cut -d' ' -f 2)%
    '')
    (pkgs.writeShellScriptBin "systemStatus" ''
      echo $(temp)c, $(myDisk), $(myMem)
    '')
    (pkgs.writeShellScriptBin "myConnection" ''
      nmcli --get-values name -c no connection show --active | head -n 1
    '')
    (pkgs.writeShellScriptBin "myDisk" ''
      df -h | grep /dev/nvme0n1p2 | cut -d' ' -f 7
    '')
    (pkgs.writeShellScriptBin "myMem" ''
      free -h | grep Mem | cut -d' ' -f 19
    '')
    (pkgs.writeShellScriptBin "junipeiro_tree" ''
        echo "i look at you and it seems like nature has healed"
    '')
  ];

  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;
    config = {
      focus.followMouse = false;
      modifier = "Mod1";

      colors.focused = {
        background = "#263014";
        border = "#2f4704";
        childBorder = "#2f4704";
        indicator = "#2f4704";
        text = "#ffffff";

      };
      fonts = {
	names = ["Dalfitra"];
	style = "Regular";
	size = 15.0;
      };

      bars = [
        {
	  colors = {
	    activeWorkspace = {
              background = "#000000";
              border = "#000000";
              text = "#ffffff";
	    };

	    background = "#263014";
	    statusline = "#ffffff";
	  };
	  fonts = {
	    names = ["Dalfitra"];
	    style = "Regular";
	    size = 12.0;
	  };
	  statusCommand = "status_bar";
	}
      ];

      keybindings = {
        "Mod1+Return" = "exec alacritty";
        "Mod1+q" = "kill";
        "Mod1+d" = "exec rofi -show drun -show-icons -font 'Dalfitra Regular 14' -bg '#263014'";
	"Mod1+g" = "exec firefox";
	"Mod1+o" = "exec obsidian";

        "Mod1+Left" = "focus left";
        "Mod1+Down" = "focus down";
        "Mod1+Up" = "focus up";
        "Mod1+Right" = "focus right";

        "Mod1+Shift+Left" = "move left";
        "Mod1+Shift+Down" = "move down";
        "Mod1+Shift+Up" = "move up";
        "Mod1+Shift+Right" = "move right";

        "Mod1+h" = "split h";
        "Mod1+v" = "split v";
        "Mod1+f" = "fullscreen toggle";

        "Mod1+s" = "layout stacking";
        "Mod1+w" = "layout tabbed";
        "Mod1+e" = "layout toggle split";

        "Mod1+Shift+space" = "floating toggle";
        "Mod1+space" = "focus mode_toggle";

        "Mod1+a" = "focus parent";

        "Mod1+Shift+minus" = "move scratchpad";
        "Mod1+minus" = "scratchpad show";

        "Mod1+1" = "workspace number 1";
        "Mod1+2" = "workspace number 2";
        "Mod1+3" = "workspace number 3";
        "Mod1+4" = "workspace number 4";
        "Mod1+5" = "workspace number 5";
        "Mod1+6" = "workspace number 6";
        "Mod1+7" = "workspace number 7";
        "Mod1+8" = "workspace number 8";
        "Mod1+9" = "workspace number 9";
        "Mod1+Tab" = "workspace number 10";


        "Mod1+Shift+1" =
          "move container to workspace number 1";
        "Mod1+Shift+2" =
          "move container to workspace number 2";
        "Mod1+Shift+3" =
          "move container to workspace number 3";
        "Mod1+Shift+4" =
          "move container to workspace number 4";
        "Mod1+Shift+5" =
          "move container to workspace number 5";
        "Mod1+Shift+6" =
          "move container to workspace number 6";
        "Mod1+Shift+7" =
          "move container to workspace number 7";
        "Mod1+Shift+8" =
          "move container to workspace number 8";
        "Mod1+Shift+9" =
          "move container to workspace number 9";
        "Mod1+Shift+0" =
          "move container to workspace number 10";

        "Mod1+p" = "exec scrot -s /home/bella/print.png";

        "Mod1+Shift+c" = "reload";
        "Mod1+Shift+r" = "restart";
        "Mod4+l" = "exec i3-msg exit";

        "Mod1+r" = "mode resize";
      };
      startup = [
        { command = "feh --bg-scale /home/bella/.wallpaper.png"; }
      ];

      gaps = {
        inner = 10;
        outer = 5;
      };
    };
  };

}
