#!/bin/bash
set -e

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Importing keybindings..."
dconf load /org/gnome/settings-daemon/plugins/media-keys/ < "$REPO_DIR/keybindings/media-keys.dconf"
dconf load /org/gnome/desktop/wm/keybindings/            < "$REPO_DIR/keybindings/wm-keybindings.dconf"
dconf load /org/gnome/shell/keybindings/                 < "$REPO_DIR/keybindings/shell-keybindings.dconf"
dconf load /org/gnome/shell/extensions/                  < "$REPO_DIR/keybindings/extensions-settings.dconf"

echo "Installing extensions..."
mkdir -p ~/.local/share/gnome-shell/extensions
cp -r "$REPO_DIR/extensions/"* ~/.local/share/gnome-shell/extensions/

echo ""
echo "Done. Enable extensions manually, then restart GNOME Shell:"
echo "  - Wayland: log out and back in"
echo "  - X11:     press Alt+F2, type 'r', press Enter"
