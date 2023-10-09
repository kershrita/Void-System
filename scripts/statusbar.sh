usbmon() {
	usb1=$(lsblk -la | awk '/sdc1/ { print $1 }')
	usb1mounted=$(lsblk -la | awk '/sdc1/ { print $7 }')

	if [ "$usb1" ]; then
		if [ -z "$usb1mounted" ]; then
			echo " |"
		else
			echo " $usb1 |"
		fi
	fi
}

fsmon() {
	ROOTPART=$(df -h | awk '/\/$/ { print $3}') 
	HOMEPART=$(df -h | awk '/\/home/ { print $3}') 
	SWAPPART=$(cat /proc/swaps | awk '/\// { print $4 }')

	echo "   $ROOTPART    $HOMEPART    $SWAPPART"
}

ram() {
	mem=$(free -h | awk '/Mem:/ { print $3 }' | cut -f1 -d 'i')
	echo  "$mem"
}

cpu() {
	read -r cpu a b c previdle rest < /proc/stat
	prevtotal=$((a+b+c+previdle))
	sleep 0.5
	read -r cpu a b c idle rest < /proc/stat
	total=$((a+b+c+idle))
	cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))
	echo  "$cpu"%
}

bettary_capacity() {
	case $BLOCK_BUTTON in
		3) notify-send "🔋 Battery module" "🔋: discharging
	🛑: not charging
	♻: stagnant charge
	🔌: charging
	⚡: charged
	❗: battery very low!
	- Scroll to change adjust xbacklight." ;;
		4) xbacklight -inc 10 ;;
		5) xbacklight -dec 10 ;;
		6) "$TERMINAL" -e "$EDITOR" "$0" ;;
	esac

	# Loop through all attached batteries and format the info
	for battery in /sys/class/power_supply/BAT?*; do
		# If non-first battery, print a space separator.
		[ -n "${capacity+x}" ] && printf " "
		# Sets up the status and capacity
		case "$(cat "$battery/status" 2>&1)" in
			"Full") status="⚡" ;;
			"Discharging") status="🔋" ;;
			"Charging") status="🔌" ;;
			"Not charging") status="🛑" ;;
			"Unknown") status="♻️ " ;;
			*) exit 1 ;;
		esac
		capacity="$(cat "$battery/capacity" 2>&1)"
		# Will make a warn variable if discharging and low
		[ "$status" = "🔋" ] && [ "$capacity" -le 25 ] && warn="❗"
		# Prints the info
		printf "%s%s%d%%" "$status " "$warn" " $capacity"; unset warn
	done && printf "\\n"

}

network() {
	case $BLOCK_BUTTON in
		1) "$TERMINAL" -e nmtui; pkill -RTMIN+4 dwmblocks ;;
		3) notify-send "🌐 Internet module" "\- Click to connect
	❌: wifi disabled
	📡: no wifi connection
	📶: wifi connection with quality
	❎: no ethernet
	🌐: ethernet working
	🔒: vpn is active
	" ;;
		6) "$TERMINAL" -e "$EDITOR" "$0" ;;
	esac

	# Wifi
	if [ "$(cat /sys/class/net/w*/operstate 2>/dev/null)" = 'up' ] ; then
		wifiicon="$(awk '/^\s*w/ { print "📶", int($3 * 100 / 70) "% " }' /proc/net/wireless)"
	elif [ "$(cat /sys/class/net/w*/operstate 2>/dev/null)" = 'down' ] ; then
		[ "$(cat /sys/class/net/w*/flags 2>/dev/null)" = '0x1003' ] && wifiicon="📡 " || wifiicon="❌ "
	fi

	# Ethernet
	[ "$(cat /sys/class/net/e*/operstate 2>/dev/null)" = 'up' ] && ethericon="🌐" || ethericon="❎"

	# TUN
	[ -n "$(cat /sys/class/net/tun*/operstate 2>/dev/null)" ] && tunicon=" 🔒"

	printf "%s%s%s\n" "$wifiicon" "$ethericon" "$tunicon"
}

#network() {
#	conntype=$(ip route | awk '/default/ { print substr($5,1,1) }')
#
#	if [ -z "$conntype" ]; then
#		echo " down"
#	elif [ "$conntype" = "e" ]; then
#		echo " up"
#	elif [ "$conntype" = "w" ]; then
#		echo " up"
#	fi
#}

volume_pa() {
	muted=$(pactl list sinks | awk '/Mute:/ { print $2 }')
	vol=$(pactl list sinks | grep Volume: | awk 'FNR == 1 { print $5 }' | cut -f1 -d '%')

	if [ "$muted" = "yes" ]; then
		echo "  muted"
	else
		if [ "$vol" -ge 65 ]; then
			echo " $vol%"
		elif [ "$vol" -ge 40 ]; then
			echo " $vol%"
		elif [ "$vol" -ge 0 ]; then
			echo " $vol%"	
		fi
	fi

}

volume_alsa() {

	mono=$(amixer -M sget Master | grep Mono: | awk '{ print $2 }')

	if [ -z "$mono" ]; then
		muted=$(amixer -M sget Master | awk 'FNR == 6 { print $7 }' | sed 's/[][]//g')
		vol=$(amixer -M sget Master | awk 'FNR == 6 { print $5 }' | sed 's/[][]//g; s/%//g')
	else
		muted=$(amixer -M sget Master | awk 'FNR == 5 { print $6 }' | sed 's/[][]//g')
		vol=$(amixer -M sget Master | awk 'FNR == 5 { print $4 }' | sed 's/[][]//g; s/%//g')
	fi

	if [ "$muted" = "off" ]; then
		echo " muted"
	else
		if [ "$vol" -ge 65 ]; then
			echo " $vol%"
		elif [ "$vol" -ge 40 ]; then
			echo " $vol%"
		elif [ "$vol" -ge 0 ]; then
			echo " $vol%"	
		fi
	fi
}


clock() {
	dte=$(date +"%D")
	time=$(date +"%H:%M")

	echo " $dte  $time"
}

main() {
	while true; do
		xsetroot -name " $(usbmon) $(ram) | $(cpu) | $(bettary_capacity) | $(network) | $(volume_alsa) | $(clock)"
		sleep 1
	done
}

main
