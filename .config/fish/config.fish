if status is-interactive
    set -x OBSIDIAN_DIR "$HOME/Documents/Obsidian"
    alias obs="cd $OBSIDIAN_DIR"
    
    set -x FISH_CFG "$HOME/.config/fish/config.fish"
    alias fishcfg="nvim $FISH_CFG"

    set -x QMK_CFG "$HOME/vial-qmk/keyboards/crkbd/keymaps/custom"
    alias qmkcfg="nvim $QMK_CFG"

    set -x KITTY_CFG "$HOME/.config/kitty/kitty.conf"
    alias kittycfg="nvim $KITTY_CFG"

    alias ls="lsd --oneline"
    alias l="ls -l"
    alias la="ls -a"
    alias lla="ls -la"
    alias lt="ls --tree"
end
