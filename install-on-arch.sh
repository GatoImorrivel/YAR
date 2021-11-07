GARKPATH="$(pwd)"

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
    ttf-ubuntu-font-family          \
    rofi                            \
    npm                             \
    xclip                           \
    cmake                           \

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
paru -S picom-jonaburg-git

echo "##############################"
echo "Installing alacritty"
echo "##############################"
paru -S --noconfirm --needed alacritty

echo "##############################"
echo "Copying configs"
echo "##############################"

mkdir ~/.config

sudo cp -r "$GARKPATH/configs" ~/.config

# Bashrc
sudo rm ~/.bashrc

sudo cp "$GARKPATH/configs/.bashrc" ~/.bashrc