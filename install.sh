#!/bin/bash

log_index=$(ls -l | grep "install-.\.log" -c)

get_log_file () {
	printf "install-%s.log" "${log_index}"
}

newline() {
	printf "\n" >> $(get_log_file)
}

log () {
	if [ $1 == 1 ]
	then
		printf "[+] %s\n" "$2" | tee -a $(get_log_file)
	else
		printf "[-] %s\n" "$2" | tee -a $(get_log_file)
	fi
}

check_error () {
	if [ $1 == 0 ]
	then
		log 1 "(${1}) ${2}"
	else
		log 0 "(${1}) An error occurred! Check log file. Exiting..."
		exit 1
	fi
}

mkdir install
cd install

# Update Repositories

log 1 "Updating repositories..."

newline
sudo pacman -Sy --noconfirm >> $(get_log_file)
newline

check_error $? "Done."

# Install Packages

log 1 "Installing packages..."

newline
sudo pacman -S $(curl -fsSL "https://raw.githubusercontent.com/Ekstropiya/Dotfiles/master/packages.txt") --noconfirm >> $(get_log_file)
newline

check_error $? "Done."

# Clone Repository

log 1 "Cloning repository..."

newline
directory="install-$(date "+%Y-%m-%d-%T")"

git clone https://github.com/Ekstropiya/Dotfiles.git "${directory}" >> $(get_log_file)
newline

check_error $? "Done."

# Install Configuration

log 1 "Installing configuration files..."

newline
cp -af "$directory/." "$HOME" >> $(get_log_file)
ln -s "$HOME/.zsh/rc" "$HOME/.zshrc" >> $(get_log_file)
newline

check_error $? "Done."

# Install oh-my-zsh and Powerlevel10k

log 1 "Installing oh-my-zsh..."

newline
ZSH="$HOME/.zsh/oh-my-zsh" RUNZSH="no" KEEP_ZSHRC="yes" CHSH="no" sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" >> $(get_log_file)
newline

check_error $? "Done."

log 1 "Installing Powerlevel10k..."

newline
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$HOME/.zsh/oh-my-zsh/custom/themes/powerlevel10k"

# Clean up.

log 1 "Installation complete. Cleaning up."

rm -rf "$directory"

remove_useless () {
	cd $HOME
	rm -rf $(cat useless_files.txt)

	# Add Screenshots directory because ImageMagick won't work without it.
	mkdir Screenshots
}

# Ask to reboot
printf "[+] Would you like to remove useless files? [Y/n]: " | tee -a $(get_log_file) 
read -r -p "" res
printf "%s\n" "${res}" >> $(get_log_file)

case "${res}" in [nN][oO]|[nN]) 
		exit 0
		;;
	*)
        remove_useless
		;;
esac
