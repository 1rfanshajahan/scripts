#!/usr/bin/env zsh

setxkbmap -option
# Get the current layout
current_layout=$(setxkbmap -query | grep layout | awk '{print $2}')

# Toggle between layouts
if [[ "$current_layout" == "us(cmk_ed_us)" ]]; then
    setxkbmap -model pc105 -layout us && notify-send "qwert"
else
    setxkbmap -model pc104angle -layout 'us(cmk_ed_us)' -option 'misc:extend,lv5:caps_switch_lock,grp:shifts_toggle,compose:menu,misc:cmk_curl_dh' && notify-send "cole"
fi

