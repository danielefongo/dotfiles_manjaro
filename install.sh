install() {
  echo Y | sudo pacman -S $@
}

install_aur() {
  git clone https://aur.archlinux.org/$1.git /tmp/$1
  cd /tmp/$1
  echo Y | makepkg -i
  cd ..
  rm -rf /tmp/$1
}

# update
sudo pacman -Syu

# essentials
install make
install patch
install glibc

# ssl 1.1.1 workaround
# (
#   if ! [[ -f /usr/local/ssl/bin/openssl ]]; then
#     cd /usr/local/src/
#     sudo wget https://www.openssl.org/source/openssl-1.1.1m.tar.gz

#     sudo tar -xf openssl-1.1.1m.tar.gz
#     cd openssl-1.1.1m
#     sudo ./config --prefix=/usr/local/ssl --openssldir=/usr/local/ssl shared zlib
#     sudo make
#     sudo make install
#   fi
# )


# asdf
install base-devel # elixir
install ncurses # elixir
install libssh # elixir

export CPPFLAGS="-I/usr/bin/openssl/include"
export LDFLAGS="-L/usr/bin/openssl/lib"
# export KERL_CONFIGURE_OPTIONS="--disable-debug --without-javac"
source dots/asdf/asdf.sh
cat ~/.tool-versions | cut -f1 -d' ' | grep -ve '^$' | while read package; do
  asdf plugin add $package
done
asdf install

# terminal
# install neovim
# install curl
# install hub
# install tig
# install_aur autojump
# install_aur ripgrep

