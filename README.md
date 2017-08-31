## Restore dotfiles

```sh
python3 restore_dotfiles.py
```

## Import Gnome3 keyboard shortcuts

```sh
dconf load /org/gnome/desktop/wm/keybindings/ < .gnome_shortcuts
```

```sh
dconf load /org/gnome/settings-daemon/plugins/media-keys/ < .gnome_custom_shortcuts
```
