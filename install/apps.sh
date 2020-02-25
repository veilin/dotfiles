declare -a mas_apps=(
  '497799835'    # Xcode
  '1295203466'   # Microsoft Remote Desktop
)

for app in "${mas_apps[@]}"; do
  mas install "$app"
done
