YARPATH="$(pwd)"

# Update pacman
echo "Updating pacman, just wait a little"
sudo pacman --noconfirm -Syu

# Install dependecies
echo "##############################"
echo "Installing a bunch of stuff"
echo "##############################"
sudo pacman -S --noconfirm --needed xorg xorg-xinit\
    bspwm sxhkd                     \
    lightdm lightdm-gtk-greeter     \
    git python3 gcc base-devel      \
    xwallpaper                      \
    mpv                             \
    ttf-cascadia-code               \
    rofi                            \
    npm                             \
    xclip                           \
    cmake                           \
    ttf-nerd-fonts-symbols

# Setup lightdm
sudo systemctl enable lightdm &

# Installing NVIM
sudo pacman -S --noconfirm --needed neovim

echo "##############################"
echo "installing Rust and alacritty"
echo "##############################"
sudo pacman -S --needed rustup cargo

rustup default stable

echo "##############################"
echo "Installing paru"
echo "##############################"
git clone https://aur.archlinux.org/paru.git
cd paru 
makepkg -si && cd ..
paru -Syu

echo "##############################"
echo "Installing Picom"
echo "##############################"
paru -S --noconfirm --needed picom-jonaburg-git

echo "##############################"
echo "Installing alacritty"
echo "##############################"
paru -S --noconfirm --needed alacritty

echo "##############################"
echo "Installing polybar"
echo "##############################"
paru -S --needed polybar

echo "##############################"
echo "Installing xwinwrap"
echo "##############################"
paru -S --needed xwinwrap

echo "##############################"
echo "Copying configs"
echo "##############################"

sudo cp -r "$YARPATH/configs" ~/
sudo mv ~/configs ~/.config

sudo cp ~/.config/scripts/generatecolorscheme.sh /bin/generatecolorscheme
sudo cp ~/.config/scripts/setwallpaper.sh /bin/setwallpaper

sudo chmod +x /bin/setwallpaper
sudo chmod +x /bin/generatecolorscheme

sudo mv ~/.config/bashrc/.bashrc ~/.bashrc
sudo rm -r ~/.config/bashrc

sudo mv ~/.config/xconfigs/.xinit ~/.xinit
sudo mv ~/.config/xconfigs/.xprofile ~/.xprofile
sudo rm -r ~/.config/xconfigs

sudo cp -r "$YARPATH/wallpapers" ~/

sudo chmod 777 ~/.config/ -R

echo "##############################"
echo "Installing pywal"
echo "##############################"
paru -S --needed pywal

wal -i "$HOME/wallpaper/squidswimmer.jpg" -n