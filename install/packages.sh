declare -a packages_apps=(
  'mas'
  'node'
  'python3'
 # 'redis'
  'speedtest-cli'
  'tree'
  'tmux'
  'wget'
  'yarn'
)

for app in "${packages_apps[@]}"; do
  brew install "$app"
done
