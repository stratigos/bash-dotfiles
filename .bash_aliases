
# 'ls' without ignoring dotfiles, using long list format, in human readable form, and display long ISO format for time
alias lsa="ls -alh --time-style=long-iso"

# view 'git diff' in vim
alias gdif="git diff | vim -R -"

# run 'git' with the letter 'g'
alias g="/usr/bin/git"
# run 'git diff' and display any lines that contain Ruby or JavaScript debug stuff
alias gdifrd="git diff | egrep -i '(puts)|(abort)|(debug)|(byebug)|(alert)|(console.log)|(TODO)'"
# Just like above, but Elixir/Phoenix stuff
alias gdifed="git diff | egrep -i '(IO\.inspect)|(abort)|(debug)|(alert)|(console.log)|(TODO)'"

# Vanta Agent
# alias vanta-cli="/var/vanta/vanta-cli"
