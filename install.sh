# Donwload Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Upgrade and Update Homebrew
brew upgrade && brew update

# Install various things
sh install/taps.sh
sh install/packages.sh
sh install/casks.sh
sh install/apps.sh

# Setup Z Shell
brew install zsh zsh-completions zsh-autosuggestions zsh-syntax-highlighting
sh -c "$(curl -fsSLk https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp configs/.my-zshrc ~

# Setup Aliases
cp configs/.aliases ~

# Setup Functions
cp configs/.functions ~
