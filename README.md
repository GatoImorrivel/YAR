# Yet Another Rice
This is my script for installing a GUI on Arch. This was made for my own use, but feel free to fork it and tell me your opinion about it.  
All of the settings are made with **1920x1080** in mind, functionality in other resolutions is not guaranteed.

This rice is made in a way that allows the user to quickly update the colorscheme of the system using pywal.  
Use `setwallpaper` to change the system's wallpaper correctly.  
Use `generatecolorscheme` to change the system's colors.

## Plans
- [x] - Replace Polybar with Eww
- [ ] - Add dunst
- [ ] - Create a dashboard
- [x] - Create a powermenu

- [ ] - Maybe add configs for 1366 resolution

## Specs

- TWM - BSPWM
- Compositor - Picom
- App Launcher - rofi
- Bar - PolyBar
- Animated Wallpaper - xwinwrap

# Screenshots
<img src='/screenshots/purpleunixporn.png'>
<img src='/screenshots/purplerofi.png'>
<img src='/screenshots/purplefirefox.png'>
<img src='/screenshots/pywalexample1.png'>
<img src='/screenshots/pywalexample2.png'>

# Installation

    git clone https://github.com/GatoImorrivel/YAR.git
    cd YAR
    sudo chmod +x ./install-on-arch.sh
    sudo sh install-on-arch.sh $(whoami)

Follow additional installation steps provided in the `postinstallwarning` file for integrating pywal with other apps.
