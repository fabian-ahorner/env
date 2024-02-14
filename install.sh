
#!/bin/sh

if [[ -z $(which brew) ]]; then
  echo "installing homebrew"
  ruby -e "$(curl -q -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
brew bundle
# Install VSCode `code` command
if ! test -f /usr/local/bin/code; then
  ln -s /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code /usr/local/bin/code

fi

# Install zsh powerlevel10k fonts
if ! test -f ~/Library/Fonts/MesloLGS\ NF\ Bold\ Italic.ttf; then
  # Download the fonts using curl
  curl -LO https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
  curl -LO https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
  curl -LO https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
  curl -LO https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf

  # Install the fonts
  mkdir -p ~/Library/Fonts
  mv MesloLGS*.ttf ~/Library/Fonts/
fi


# Terminal
if ! test -d ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
  echo 'ZSH_THEME="powerlevel10k/powerlevel10k"' >> ~/.zshrc
fi