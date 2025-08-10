# Usage
## Shell
- I opted for the Z shell (zsh)
## Homebrew
- I used Homebrew as my package manager of choice
- I installed the following packages:
  - bat (For pretty printing cat outputs)
  - eza (For tree-like display of ls)
  - fzf (For fuzzy finding files)
  - ripgrep (Like grep, but Herbs said it was better)
  - lazygit (For a cool looking git TUI)
## Terminal Theming
- I used `oh-my-zsh` to enable terminal customisation and themes
## Zshrc
- I created a `.zshrc` file that handles the setting of themes and sourcing of aliases and tmux, along with configuring `fzf`
- If you have an existng `.zshrc`, I would recommend renaming it before copying my one
- To copy my one run: `cp ./.zshrc ~/.zshrc`
- Then you can source your new zshrc file with my custom alias: `src-shell`
## Aliases
- I created a `.aliases` file that is sourced in the `.zshrc` file to better split the logic between config setups
- You can copy these aliases by running: `cp ./.aliases ~/.aliases`
## NVIM
- I also created a custom `nvim` config with a few cool plugins
- To use run: `cp -r nvim ~/.config/nvim`
- I used `Lasy` as a package manager and `Mason` for the LSP manager
- To add add LSPs:
  - Open nvim
  - Run `:Mason`
  - Search for the LSP you want
  - Enable it using the command `:vim.lsp.enable("<lsp name>")`
  - Alternatively, add the LSP you want to the mason lsp config - ensure installed record in the plugins folder and then enable it in the lsp config file under the settings folder
- To customise dashboard:
  - In the `alpha.lua plugin`, you can change the dashboard text with your own ascii art (I would recommend looking [here](https://github.com/MaximilianLloyd/ascii.nvim/tree/master/lua/ascii) for cool examples)
- To view a list of my custom keymaps, take a look at the `keymaps.lua` file in the settings folder
## TMUX
- Install all the prequisites
- Clone this repo
- Copy the `.tmux.conf` file into the home directory: `cp .tmux.conf ~/`
### TMUX Cheatsheet
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
### TMUX Prerequisites
- tmux needs to be installed
- tpm is required:
  - git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  - Install plugins using <C-b> I
  - Uninstall removed plugins: <C-b> <M> u
  - Update plugins: <C-b> u
- A nerd font must be installed (I used Fira Code when writing this)
  - [Nerd Font Glyphs](https://www.nerdfonts.com/cheat-sheet)
# Notes & Considerations
- I initially started my terminal setup using the linux apt package manager before swiching over to homebrew, so there might be a few discrepencies between alias names like bat and batcat along with postgres.
## Collaborators
![Matthew Reed](https://github-readme-stats.vercel.app/api?username=mattreed01&show_icons=true&theme=tokyonight)
