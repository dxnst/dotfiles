#!/bin/dash

# This function makes your bar laggy
#weather() {
#    echo -n "$(curl https://wttr.in/Paris?format=3)"
#}

artist() {
    echo -n "$(cmus-remote -Q | grep ' artist ' | cut -d ' ' -f3-)"
}

song() {
    echo -n "$(cmus-remote -Q | grep title | cut -d ' ' -f3-)"
}

batt() {
  case "$(cat /sys/class/power_supply/BAT*/status 2>/dev/null)" in
    Discharging) echo -n " " ;;
    Charging) echo -n " " ;;
    Full) echo -n " " ;;
  esac
  echo -n "$(cat /sys/class/power_supply/BAT*/capacity)"
}

clock() {
  echo -n " $(date '+%d/%m %H:%M')"
}

wlan() {
  case "$(cat /sys/class/net/w*/operstate 2>/dev/null)" in
  up) echo -n "ﳊ Connected" ;;
  down) echo -n "ﲁ Disconnected" ;;
  esac
}

vol() {
    echo -n "墳 $(pamixer --get-volume)"
}

while true; do
    echo " $(artist)-$(song) $(vol)% $(wlan) $(batt)% $(clock)"
	sleep 1
done
