xbps-install -yu xbps

xbps-install -Suy

git
vim

# bluetooth for keyboard
xbps-install bluez
sudo ln -s /etc/sv/bluetoothd /etc/runit/runsvdir/default
# connecting to device: https://wiki.archlinux.org/title/Bluetooth#Pairing

setxkbmap

# monitors
xbps-install arandr
xset

# minimum for suckless build
base-devel
libXinerama-devel
libXft-devel

# ssh key
ssh-keygen -t ed25519 -C "email@example.com"
eval "$(ssh-agent -s)"
ssh-add id_ed25519

wget
neofetch

# font
https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/IosevkaTerm.tar.xz
tar -xf IosevkaTerm.tar.xz -C IosevkaTerm
sudo install -d /usr/share/fonts/IosevkaTerm
sudo install -m 644 /path/to/your/font/IosevkaTerm/* /usr/share/fonts/IosevkaTerm
fc-cache
