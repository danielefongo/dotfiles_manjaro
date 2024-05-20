updates=()
while read -r update; do
	updates+=("$update")
done < <(pacman -Qu)

packages=()
while read -r package; do
	packages+=("$package")
done < <(pacman -Q)

search_update() {
	printf '%s\n' "${updates[@]}" | grep "^$1"
}

search_package() {
	printf '%s\n' "${packages[@]}" | grep "^$1"
}

install() {
	set -e
	APP=$1
	if [ -n "$(search_update $APP)" ] || ! [ -n "$(search_package $APP)" ]; then
		yay -S --noconfirm $APP
	else
		echo "Skip $APP..."
	fi
}

# essentials
install make
install inotify-tools

# languages
if ! [ $(command -v mise) ]; then
	curl https://mise.jdx.dev/install.sh | sh
fi
mise install -y

# terminal
install zsh
[ "$(echo $SHELL)" == /usr/bin/zsh ] || chsh -s $(which zsh)
install autojump-rs
install fzf
install ripgrep

install neovim
install entr
install tmux
install git
install tig
install git-delta
install hub
install btop
install sassc

# utils
install alacritty

install i3-wm
install i3lock-fancy-rapid-git
install rofi
install dunst
install polybar
install flameshot
install feh
install picom
install xbindkeys
install playerctl
install xsettingsd
install redshift
install xdotool

# docker
install docker
install docker-compose
sudo systemctl start docker.service
sudo systemctl enable docker.service
sudo usermod -aG docker $USER
