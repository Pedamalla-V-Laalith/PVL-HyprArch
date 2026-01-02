# PVL-HyprArch

## Steps Followed

### Packages Installed
* `sudo pacman -S kitty`
* `sudo pacman -S hyprland`
* `sudo pacman -S wofi`
* `sudo pacman -S waybar otf-font-awesome`
* `sudo pacman -S thunar tumbler`
* `sudo pacman -S hyprlock`

### Symlinks Created
* `ln -s ~/.config/PVL-HyprArch/hypr ~/.config/hypr`
* `ln -s ~/.config/PVL-HyprArch/kitty ~/.config/kitty`
* `ln -s ~/.config/PVL-HyprArch/Thunar ~/.config/Thunar`
* `ln -s ~/.config/PVL-HyprArch/waybar ~/.config/waybar`

### Implemented Wallpaper changer using matugen and swww
***
#### Pre-requisites
* Please ensure that folder `~/Pictures/Wallpapers` exist in your system with atleast one picture
* Please ensure that a symlink `~/.cache/current_wallpaper` exists to point towards a wallpaper to ensure hyprlock doesn't misbehave before running the Wallpaper changer tool. After you run the tool it will automatically be created to point towards the wallpaper which you selected through the tool.
***
* `yay -S swww matugen-bin`
* Created a config folder for matugen and added config.toml and template for hyprland as an example. Templates are added in `matugen/templates` folder
* The config file also has a hook to swww with transition effects to change the wallpaper whenever matugen is executed for an image to generate colors.
* Created a rudimentary config file for wofi to use wofi as a wallpaper picker tool.
* Created symlinks for both folders
* `ln -s ~/.config/PVL-HyprArch/matugen ~/.config/matugen`
* `ln -s ~/.config/PVL-HyprArch/wofi ~/.config/wofi`
* Created a script `wallChanger.sh` in `hypr/scripts` folder and made it executable with `chmod +x ~/.config/hypr/scripts/wallChanger.sh`. This script will be responsible to show all the Wallpapers that exist in `~/Pictures/Wallpapers` folder through wofi and execute matugen tool on the selected Wallpaper. It also creates a symlink `~/.cache/current_wallpaper` which links to the selected wallpaper to keep track of current wallpaper.
* `hyprlock.conf` is updated to use the current wallpaper as background through the symlink
* Added `swww-daemon` to `hyprland.conf` for `exec-once`.
* Added a shortcut for the wallChanger tool to work as toggle on keybinding SUPER + W