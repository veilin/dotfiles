declare -a cask_apps=(
  'adobe-acrobat-reader'
  'android-studio'
  'firefox'
  'google-chrome'
  'intellij-idea'
  'insomnia'
  'java'
  'keepingyouawake'
  'lastpass'
  'microsoft-teams'
#  'mysqlworkbench'
#  'opera'
#  'pgadmin4'
#  'robo-3t'
#  'skype'
#  'slack'
#  'spotify'
#  'sublime-text'
  'the-unarchiver'
  'visual-studio-code'
  'vlc'
  'whatsapp'
  'adoptopenjdk8'
  'adoptopenjdk11'
)

for app in "${cask_apps[@]}"; do
  brew cask install "$app"
done
