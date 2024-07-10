#!/usr/bin/env bash

NONE='\033[0m'
YELLOW='\033[0;33m'
BLUE='\033[0;36m'

clear
cd $HOME
set -e


# =====================================
# Installing Dependencies
# =====================================

sudo pacman -Sy
sudo pacman -S git wget unzip gum rsync stow


# =====================================
# Installing paru (AUR helper)
# =====================================

if sudo pacman -Qs paru > /dev/null; then
  echo ":: paru is already installed"
else
  echo ":: Installing paru..."
  sudo pacman -S --needed base-devel
  git clone https://aur.archlinux.org/paru.git ~/paru
  pushd ~/paru > /dev/null
  makepkg -si
  popd > /dev/null
  rm -rf ~/paru
fi


# =====================================
# Choosing Packages to Download
# =====================================

touch categories.txt
touch download.txt

while IFS= read -r line; do
  if [[ $line =~ ":" ]]; then
    echo "${line%:}" >> categories.txt
  fi
done < packages.yaml

echo -e $BLUE
echo "Choose Which Packages to Download (select all for optimal experience)"
echo "All the packages are listed at 'install/packages.toml' (you can exit the script and edit the list right now)"
echo -e $NONE
cat categories.txt | gum choose --no-limit --height 20 >> download.txt
echo >> download.txt

packages=()
while IFS= read -r category; do
  found="no"
  while IFS= read -r line; do
    if [[ $line =~ ":" ]]; then
      if [[ $found == "yes" ]]; then
        break
      fi
      current=${line%:}
      if [[ $current == $category ]]; then
        found="yes"
      fi
    elif [[ $line =~ "  - " ]] && [ $found == "yes" ]; then
      packages+=("${line#"  - "}")
    fi
  done < packages.yaml
done < download.txt

for pkg in ${packages[@]}; do
  echo "$pkg"
done

rm categories.txt
rm download.txt


# =====================================
# Installing Packages
# =====================================

CheckInstalled() {
  pkg=$1
  check=$(pacman -Qs $pkg | grep "local" | grep $pkg)
  if [ -n "$check" ]; then
    echo 0
    return
  else
    echo 1
    return
  fi
}

InstallPackages() {
  installList=()
  for pkg; do
    if [[ $(CheckInstalled "$pkg") == 0 ]]; then
      echo ":: $pkg is already installed"
      continue
    fi
    installList+=("${pkg}")
  done

  if [[ "${installList[@]}" == "" ]]; then
    return
  fi

  sudo paru --noconfirm -S "${installList[@]}"
}

InstallPackages "${packages[@]}"


# =====================================
# Copying Dotfiles
# =====================================

echo -e $YELLOW
echo ""
echo "WARNING: This script does not support NVIDIA graphics driver"
echo "WARNING: This script will download all the configuration files even if you didn't download the packages"
echo -e $NONE

if gum confirm "Do you want to clone the repository? (Don't if you've already cloned one)"; then
  echo ":: Cloning configuration files..."
  if [ -d "Dotfiles" ]; then;
    echo ":: There is a directory named Dotfiles, backing it up..."
    mv Dotfiles Dotfiles.bak
  fi
  git clone https://github.com/PpP-0831/dotfiles Dotfiles
fi

pushd ~/Dotfiles > /dev/null
stow . --adopt
popd > /dev/null
git restore .


# =====================================
# Post Installation Setup
# =====================================

echo ":: Installing tree-sitter-cli..."
cargo install tree-sitter-cli

echo ":: Enabling bluetooth..."
systemctl enable bluetooth
systemctl start bluetooth

if gum confirm "Do you want to set zsh as the default login shell?"; then
  chsh -s /usr/bin/zsh
  echo ""
fi

if gum confirm "Do you want to apply LibreWolf configs?"; then
  cp ../others/librewolf/librewolf.overrides.cfg ~/.librewolf
  echo ":: Config applied, but you still have to apply css and bookmarks manually after you created your profile"
fi

if gum confirm "Do you want to overwrite Hyprland monitor settings?"; then
  screenres=$(gum choose --height 15 "1280x720" "1280x800" "1440x900" "1280x1024" "1680x1050" "1280x1440" "1600x1200" "1920x1080" "1920x1200" "2560x1440" "3840x2160")
  search="monitor = "
  replace="# monitor = "
  sed -i -e "s/$search/$replace/g" ~/.config/hypr/hyprland.conf
  search="# monitor=,preferred,auto,auto"
  replace="monitor = , $screenres, auto, 1"
  sed -i -e "s/$search/$replace/g" ~/.config/hypr/hyprland.conf
  echo ":: Screen resolution set to $screenres"
fi

if gum confirm "Reboot now?"; then
  systemctl reboot
else
  echo -e $YELLOW
  echo "Please reboot the system after the installation"
  echo -e $NONE
fi
