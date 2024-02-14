if ! test -f ~/.ssh/id_ed25519; then
  echo "Generating new SSH key"
  echo "What is your github email?"
  read github_email
  ssh-keygen -t ed25519 -C $github_email
  eval "$(ssh-agent -s)"
  touch ~/.ssh/config

  echo "Host github.com
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519" >> ~/.ssh/config

  ssh-add --apple-use-keychain ~/.ssh/id_ed25519
fi

pbcopy < ~/.ssh/id_ed25519.pub
echo "SSH key copied to clipboard"
echo "Press ENTER to open github"
read
open https://github.com/settings/keys