DOWNLOAD="$(~/.config/polybar/networkscript.py)"
UPLOAD="$(~/.config/polybar/networkscript.py --upload)"

PRIMARYCOLOR="$(cat ~/.config/polybar/bar | grep "primary = #")"
FOREGROUNDCOLOR="$(cat ~/.config/polybar/bar | grep "foreground = #")"

PRIMARYCOLOR="${PRIMARYCOLOR#"primary = #"}"
FOREGROUNDCOLOR="${FOREGROUNDCOLOR#"foreground = #"}"

ARROWCOLOR="%{F#$PRIMARYCOLOR}"
TEXTCOLOR="%{F#$FOREGROUNDCOLOR}"
DISCONNECTED='Disconnected'

if [ "$DOWNLOAD" = "" ]; then
    if [ "$UPLOAD" = "" ]; then
        echo "$ARROWCOLOR$DISCONNECTED"
        exit 1
    fi
else
    echo "$ARROWCOLOR $TEXTCOLOR$DOWNLOAD  $ARROWCOLOR $TEXTCOLOR$UPLOAD"
    exit 0
fi