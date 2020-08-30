# Show neofetch for every new terminal
neofetch --colors 4 4 0 4 4 15 --ascii_colors 32 26 --disable theme icons

# Plugins
source /home/noah/.zplugins/git-prompt.sh
source /home/noah/.zplugins/zsh-vim-mode/zsh-vim-mode.plugin.zsh
source /home/noah/.zplugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source /home/noah/.zplugins/pass.zsh-completion

# Remove all escape bindings for instant NORMAL mode
bindkey -r -p '^[^['
bindkey -p '^[^['

# Prompt variable customization
setopt prompt_subst 
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM="auto"
MODE_INDICATOR_VIINS='%B%F{4}[ INSERT ]'
MODE_INDICATOR_VICMD='%B%F{4}[ NORMAL ]'
MODE_INDICATOR_REPLACE='%B%F{4}[ REPLACE ]'
MODE_INDICATOR_SEARCH='%B%F{4}[ SEARCH ]'
MODE_INDICATOR_VISUAL='%B%F{4}[ VISUAL ]'
MODE_INDICATOR_VLINE='%B%F{4}[ V-LINE ]'

# Prompt
PROMPT='%B%F{4}[%f %F{1}%n%f%b %F{7}%~%f %B%F{4}]%f%b %B%F{4}%(!.#.$)%f%b '
RPROMPT='%B%F{4}$(__git_ps1 "[ %s ]") ${MODE_INDICATOR_PROMPT} [ %(?.✓.✗ %?) ]%b'

# Aliases
alias vim='nvim'
alias zshrc='vim ~/.zshrc'
alias vimrc='vim ~/.config/nvim/init.vim'
alias i3config='vim ~/.config/i3/config'
alias dwmh='vim ~/.config/dwm/config.h'
alias dwmmake='sudo make -C ~/.config/dwm clean install'
alias sth='vim ~/.config/st/config.h'
alias stmake='sudo make -C ~/.config/st clean install'
alias blocksh='vim ~/.config/dwmblocks/blocks.h'
alias blocksmake='sudo make -C ~/.config/dwmblocks clean install'
alias q='exit'
alias ls='exa'
alias la='ls -aa'
alias ll='ls -laam'
alias ld='ls -1aa'
alias lr='ls -R1a'
alias rm='rm -I'
alias mount='mount -o uid=1000'
alias grep='grep --color'
alias grub-config='sudo vim /etc/default/grub'
alias stopx='sudo pkill x'
alias piconf='vim ~/.config/picom/picom.conf' 
alias rice='git --git-dir=/home/noah/rice.git --work-tree=/home/noah'
alias pdf='zathura'
alias feh='feh -d'
alias youtubeaudio='youtube-dl -f bestaudio'
alias youtubevideo='youtube-dl -f bestvideo'
alias dirsize='du -sh'
alias passmenu="passmenu -l 5 -fn 'Roboto Mono:pixelsize=12'"
