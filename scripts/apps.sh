updates=()
while read -r update; do
	updates+=("$update")
done < <(pacman -Qu)

get_updates() {
	printf '%s\n' "${updates[@]}"
}

install() {
	set -e
	APP=$1
	if [ -n "$(get_updates | grep -e ^$APP)" ]; then
		yay -S --noconfirm $APP
	else
		echo "Skip $APP..."
	fi
}

# essentials
install make
install inotify-tools

# terminal
install zsh
[ "$(echo $SHELL)" == /usr/bin/zsh ] || chsh -s $(which zsh)
install autojump-rs
install fzf
install ripgrep

if ! [ $(command -v mise) ]; then
	curl https://mise.jdx.dev/install.sh | sh
	mise install -y
else
	echo "Skip mise..."
fi
install neovim
install entr
install tmux
install git
install tig
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
