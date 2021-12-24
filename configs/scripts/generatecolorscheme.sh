COLORSDIR="$HOME/.config/colors"
WALCACHE="$HOME/.cache/wal"

WALLPAPER=$2
SATURATION=$1

if [[ "$1" = "-h" ]] || [[ "$1" = "--help" ]]; then
	printf "first argument is saturation (value between 0-1)\nsecond argument is the wallpaper file\n"
	exit 3
fi

[ ! -d "$COLORSDIR" ] && mkdir -p "$COLORSDIR"

if [ "$SATURATION" -lt "0" ] || [ "$SATURATION" -gt "1" ]; then
	echo "Invalid saturation level. Must be between 0-1"
	exit 1
fi

if [ ! -f "$(realpath $WALLPAPER)" ]; then
	echo "File doesnt exist"
	exit 2
fi

copyColors() {
	[ -f "$COLORSDIR/*" ] && sudo rm "$COLORSDIR/*"
	sudo cp "$WALCACHE/colors.sh" $COLORSDIR
	sudo cp "$WALCACHE/colors.yml" $COLORSDIR
	sudo cp "$WALCACHE/colors.Xresources" $COLORSDIR
	sudo cp "$WALCACHE/colors-rofi-dark.rasi" $COLORSDIR
}

wal -s -t -n --saturate $SATURATION -i $WALLPAPER && copyColors
