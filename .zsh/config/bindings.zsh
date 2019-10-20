#!/usr/bin/env zsh

bindkey -v

if tput cbt > /dev/null; then
	bindkey "$(tput cbt)" reverse-menu-complete
fi

zle-keymap-select zle-line-init () {
	if [ "$TERM" = 'linux' ]; then
		printf '\033[?16;0;224c'
	fi

	if [ "$TERM" != 'linux' ]; then
		case $KEYMAP in
		vicmd)
			printf '\033[2 q'
			;;
		main|vinns)
			printf '\033[6 q'
			;;
		*)
			printf '\033[2 q'
		esac
	fi
}
zle -N zle-line-init
zle -N zle-keymap-select

fg-bg() {
	if [ "$#BUFFER" -eq 0 ]; then
		BUFFER=fg
		zle accept-line -w
	else
		zle push-input -w
		zle clear-screen -w
	fi
}
zle -N fg-bg
bindkey '^Z' fg-bg
