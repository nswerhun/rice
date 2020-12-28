# Enable custom command completion
autoload -Uz compinit
compinit

function greeting() {
    quote=$(/usr/local/bin/motivate --no-colors)
    /home/noah/scripts/pfetch
    echo -e "\e[1m\e[94m$(head -n 1 <<< $quote)\e[0m\n\e[37m$(tail -n 1 <<< $quote)"
}
# Show pfetch for every new terminal, for every user except root
[ $UID = 0 ] && print -P "%B%F{1}YOU ARE ROOT. BE CAREFUL.%f%b" || greeting

# Plugins
source $ZDOTDIR/.zplugins/git-prompt.sh
source $ZDOTDIR/.zplugins/zsh-vim-mode/zsh-vim-mode.plugin.zsh
source $ZDOTDIR/.zplugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZDOTDIR/.zplugins/zsh-colored-man-pages/colored-man-pages.plugin.zsh

# Remove all escape bindings for instant NORMAL mode
bindkey -r -p '^[^['
bindkey -p '^[^['

# Prompt variable customization
setopt prompt_subst 
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM="auto"
MODE_INDICATOR_VIINS='[ INSR ]'
MODE_INDICATOR_VICMD='[ NORM ]'
MODE_INDICATOR_REPLACE='[ REPL ]'
MODE_INDICATOR_SEARCH='[ SRCH ]'
MODE_INDICATOR_VISUAL='[ VISL ]'
MODE_INDICATOR_VLINE='[ V-LI ]'

# Prompt
PROMPT='%B%F{4}[%f %F{1}%n%f%b %F{7}%~%f %B%F{4}]%f%b %B%F{4}%(!.#.$)%f%b '
RPROMPT='%B%F{4}$(__git_ps1 "[ %s ]") ${MODE_INDICATOR_PROMPT} [ %(?.✓.✗ %?) ]%f%b'

# Root prompt
[ $UID = 0 ] &&
    PROMPT='%B%F{1}[ %UROOT%u %/ ] %(!.#.$)%f%b ' &&
    RPROMPT='%B%F{1}$(__git_ps1 "[ %s ]") ${MODE_INDICATOR_PROMPT} [ %(?.✓.✗ %?) ]%f%b'

# Aliases
source $ZDOTDIR/.zaliases
