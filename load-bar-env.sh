#!/bin/bash
notify_color_bg=#3f4346
notify_color_fg=#e6e6e6
notify_hi_fg="#bfe0bf"
notify_low_fg=#7e8578
notify_icon_fg=$notify_low_fg
notify_color_error="#ff6e4d"
notify_color_warn="#ffb100"
notify_color_success="#49ffbc"
function icon {
	_color="$3"
	if [[ -z $_color ]]; then
		_color="$notify_low_fg"
	fi

	export $1="%{F$_color}$2%{F$notify_color_fg}"
}
icon VOL_ICON "\uf028"
icon MUTE_ICON "\uf026×" $notify_color_error
icon KEYBOARD_ICON "\uf11c"
icon CLOCK_ICON "\uf017"
icon CALENDAR_ICON "\uf073"
icon REDSHIFT_ICON "\uf042"
icon TV_ICON "\uf26c"
icon BATTERY_ICON "\uf240"
icon BATTERY_4_ICON "\uf240"
icon BATTERY_3_ICON "\uf241"
icon BATTERY_2_ICON "\uf242"
icon BATTERY_1_ICON "\uf243"
icon BATTERY_0_ICON "\uf244"
icon BATTERY_4_DISCHARGING_ICON "\uf240" $notify_color_warn
icon BATTERY_3_DISCHARGING_ICON "\uf241" $notify_color_warn
icon BATTERY_2_DISCHARGING_ICON "\uf242" $notify_color_warn
icon BATTERY_1_DISCHARGING_ICON "\uf243" $notify_color_error
icon BATTERY_0_DISCHARGING_ICON "\uf244" $notify_color_error
icon CHORD_PLUGGED "\uf1e6"
icon WIFI_ICON "\uf1eb"
icon WIFI_DISCONNECTED_ICON "\uf1eb ×" $notify_color_error
icon DESKTOP_ICON "\uf108"
icon VPN_ICON "\uf0ac"
icon UNLOCKED "\uf084 \uf13e"
