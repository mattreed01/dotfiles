Just some configuration files for me to have a cool looking terminal

# Usage
## TMUX
- Install all the prequisites
- Clone this repo
- Copy the `.tmux.conf` file into the home directory: `cp .tmux.conf ~/`
# TMUX Cheatsheet
- Leader/Prefix: <C-b>
- New window: <C-b> c
- Next window: <C-b> n
- Previous window: <C-b> p
- Close window: <C-d>
- Split vertical: <C-b> |
- Split horizontal: <C-b> -
- Cycle panes: <C-b> <ARROWKEY> OR <M> <ARROWKEY> // <M> is usually the <alt> key
- Enter command mode: <C-b> :
- List sessions: <C-b> s
- Source config file: <C-b> r
- Zoom in on pane: <C-b> z
# TMUX Prerequisites
- tmux needs to be installed
- tpm is required:
  - git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  - Install plugins using <C-b> I
  - Uninstall removed plugins: <C-b> <M> u
  - Update plugins: <C-b> u
- A nerd font must be installed (I used Fira Code when writing this)
  - [Nerd Font Glyphs](https://www.nerdfonts.com/cheat-sheet)