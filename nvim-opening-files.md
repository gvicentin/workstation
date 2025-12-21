# Opening Files from Nvim and Oil.nvim

To open files directly from Nvim and Oil.nvim I had to set up a few things.

`~/.config/mimeapps.list`
```
[Default Applications]
image/jpeg=feh.desktop
image/png=feh.desktop
image/gif=feh.desktop
image/webp=feh.desktop
image/bmp=feh.desktop
image/tiff=feh.desktop
application/x-tiled-tmx=tiled.desktop
application/x-tiled-tsx=tiled.desktop
```

## Feh

Usually feh already comes with a `feh.desktop` at `/usr/share/applications/feh.desktop`. 

Validate if that works by running:

```bash
xdg-mime query default image/jpeg
```

## Tiled

Create a `tiled.desktop` file at `~/.local/share/applications/tiled.desktop` with the following content:

```
[Desktop Entry]
Type=Application
Name=Tiled
GenericName=Tile Map Editor
Comment=2D tile map editor
Exec=tiled %F
Icon=tiled
Terminal=false
Categories=Development;Graphics;
MimeType=application/x-tiled-tmx;application/x-tiled-tsx;
```

`xdg-mime` will detect tiled files as `text/xml` still, so I need to create a wrapper
script for `xdg-open` to open tiled files correctly.

`~/.local/bin/xdg-open`

```bash
#!/bin/sh

# Absolute path to the real xdg-open
REAL_XDG_OPEN="/usr/bin/xdg-open"

# Only intercept single-file opens
if [ "$#" -eq 1 ]; then
  case "$1" in
    *.tmx|*.tsx)
      exec tiled "$1"
      ;;
  esac
fi

# Fallback to the real xdg-open
exec "$REAL_XDG_OPEN" "$@"
```
