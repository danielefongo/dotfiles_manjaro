# essentials
yay -S make --noconfirm
yay -S inotify-tools --noconfirm

# terminal
yay -S zsh --noconfirm
chsh -s $(which zsh)
yay -S autojump-rs --noconfirm
yay -S fzf --noconfirm
yay -S ripgrep --noconfirm

curl https://mise.jdx.dev/install.sh | sh
mise install -y
yay -S neovim --noconfirm
yay -S entr --noconfirm
yay -S tmux --noconfirm
yay -S git --noconfirm
yay -S tig --noconfirm
yay -S hub --noconfirm
yay -S btop --noconfirm
yay -S sassc --noconfirm

# utils
yay -S alacritty --noconfirm

yay -S i3 --noconfirm
yay -S i3lock-fancy-rapid --noconfirm
yay -S rofi --noconfirm
yay -S dunst --noconfirm
yay -S polybar --noconfirm
yay -S flameshot --noconfirm
yay -S feh --noconfirm
yay -S picom --noconfirm
yay -S xbindkeys --noconfirm
yay -S playerctl --noconfirm
yay -S xsettingsd --noconfirm
yay -S redshift --noconfirm
yay -S xdotool --noconfirm

# docker
yay -S docker --noconfirm
yay -S docker-compose --noconfirm
sudo systemctl start docker.service
sudo systemctl enable docker.service
sudo usermod -aG docker $USER
