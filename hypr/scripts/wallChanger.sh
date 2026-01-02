#!/bin/bash

# 1. Define your wallpaper directory
DIR="$HOME/Pictures/Wallpapers"

# 2. Check if directory exists
if [ ! -d "$DIR" ]; then
    # notify-send "Error" "Wallpaper directory not found."
    exit 1
fi

# 3. Generate the list for wofi
# We format it as img:path:text:name so wofi shows the preview
# We use 'find' to handle filenames with spaces correctly
CHOICE=$(find "$DIR" -type f \( -name "*.jpg" -o -name "*.png" -o -name "*.jpeg" -o -name "*.webp" \) | while read -r line; do
    echo "img:$line:text:$(basename "$line")"
done | wofi --conf ~/.config/wofi/wofi_wallChanger_config --dmenu)

# 4. Extract the path from the wofi selection
# Wofi returns the full string, we need to strip 'img:' and the 'text:' part
SELECTED_PATH=$(echo "$CHOICE" | sed 's/^img://;s/:text:.*$//')

# 5. Execute if a choice was made
if [ -n "$SELECTED_PATH" ]; then
    # Run matugen to generate colors and trigger swww via the hook we made
    matugen image "$SELECTED_PATH"

    # Create the symlink for persistence
    # This resolves the path to ~/.cache/current_wallpaper_path
    ln -sf "$SELECTED_PATH" "$HOME/.cache/current_wallpaper"
    
    # notify-send "Wallpaper Updated" "$(basename "$SELECTED_PATH")"
fi