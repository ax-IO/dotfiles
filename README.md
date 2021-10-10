# 1. On Current Machine
## After installing chezmoi, initialize chezmoi
chezmoi init
## Add files
chezmoi add FILE/DIRECTORY

## Apply the changes
chezmoi -v apply

## Commit the changes
chezmoi cd
git add .
git commit -m "MESSAGE"
git push -u origin main

# 2. On a second Machine
## Initialize chezmoi with dotfiles repo and Apply the changes
chezmoi init --apply ax-IO

## Pull and apply the latest changes from the repo
chezmoi update 
