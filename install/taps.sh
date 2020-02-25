declare -a taps=(
  'buo/cask-upgrade'
  'homebrew/cask-versions'
  'homebrew/cask-cask'
  'homebrew/bundle'
  'homebrew/core'
  #development stuff
  #'adoptopenjdk/openjdk'
)

for tap in "${taps[@]}"; do
  brew tap "$tap"
done
