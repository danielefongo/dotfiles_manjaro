install_mise_plugin() {
	name=$1
	version=$(cat dots/mise/config.toml | grep $name | awk -F '"' '{print $2}')
	mise install "$name@$version"
}

sudo pacman -Syu --noconfirm
sudo pacman -S --needed git base-devel npm --noconfirm
sudo pacman -S yay --noconfirm

curl https://mise.jdx.dev/install.sh | sh
install_mise_plugin nodejs
install_mise_plugin python

./dots/scripts/dots_setup
