## Restore dotfiles

```sh
stow <dirname>...
```

## Import Gnome3 keyboard shortcuts

```sh
dconf load /org/gnome/desktop/wm/keybindings/ < .gnome_shortcuts
```

```sh
dconf load /org/gnome/settings-daemon/plugins/media-keys/ < .gnome_custom_shortcuts
```

```sh
dconf load /org/gnome/shell/keybindings/ < .gnome_shell_shortcuts
```

### Disable xhc wakeup

```sh
sudo ln -s ~/dotfiles/disable-xhc-wakeup.sh /usr/local/bin
sudo ln -s ~/dotfiles/disable-xhc-wakeup.service /etc/systemd/system/ 
# maybe sudo setenforce Permissive
sudo systemctl enable disable-xhc-wakeup.service
# sudo setenforce Enforcing
```
