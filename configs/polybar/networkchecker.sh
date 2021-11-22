STATUS="$(~/.config/polybar/networkscript.py) $(~/.config/polybar/networkscript.py --upload)"

if [ "$STATUS" = " " ] then;
    echo "Disconnected"
    exit 1
else
    echo $STATUS
    exit 0
fi