# This snippet added to the .bashrc file will optionally show the git branch and color the user@host:path$ string. 
# It works with mac and cygwin.

# Git branch in prompt.
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
# Colours with tput; https://unix.stackexchange.com/questions/269077/tput-setaf-color-table-how-to-determine-color-codes
RED="\[$(tput setaf 214)\]"
GREEN="\[$(tput setaf 35)\]"
TURQUOISE="\[$(tput setaf 36)\]"
BLUE="\[$(tput setaf 33)\]"
YELLOW="\[$(tput setaf 226)\]"
BOLD="\[$(tput bold)\]"
RESET="\[$(tput sgr0)\]"
export PS1="${BLUE}\u${RESET}@${TURQUOISE}\h:${YELLOW}\w${RED}${BOLD}\$(parse_git_branch)\[\033[00m\]${RESET}$"
