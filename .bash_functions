# Set gnome-terminal title for `/bin/bash`
function stit() {
  if [[ -z "$ORIG" ]]; then
    ORIG=$PS1
  fi
  TITLE="\[\e]2;$*\a\]"
  PS1=${ORIG}${TITLE}
}

# Set gnome-terminal title for `/bin/zsh`
function ztit() {
  echo -en "\e]0;$*\a"
}

# Context-specific titles for `/bin/zsh`

## Phoenix Server
function ztitphx() {
  echo -en "\e]0;🐓🔥💻\a"
}

## Ruby / Rails prompt
function ztitrails() {
  echo -en "\e]0;💎 🛤 💻 🛤 💎\a"
}

## Puma (Rails) Server
function ztitpuma() {
  echo -en "\e]0;😼 Puma 🐈\a"
}

## PostgreSQL
function ztitpsql() {
  echo -en "\e]0;🐘 - PSQL - 🐘\a"
}

# Tools

## Hub
function ztithub() {
  echo -en "\e]0;🚂 🤖 Hub 🤖 🚂\a"
}

## ADS (Frontend / Client app)
function ztitelm() {
  echo -en "\e]0;🌳 Elm App 🌳\a"
}

## React JavaScript FE
function ztitreact() {
  echo -en "\e]0;⚛ React JS ⚛\a"
}

## SBT
function ztitsbt() {
  echo -en "\e]0;💻 SBT 💻\a"
}

## Heroku
function ztitheroku() {
  echo -en "\e]0;🐿 Heroku 🐿\a"
}

## Elastic Search
function ztites() {
  echo -en "\e]0;❔ elastic search ❔\a"
}

## 'Worker' Tab
function ztitwrk() {
  echo -en "\e]0;👨‍💻 ~worker~ 👨‍💻\a"
}

# Ops

## Open a new terminal tab
function new_tab() {
  # without xdotool:
  # create and set title for new tab, and switch focus to it
  # gnome-terminal --tab --active --title="newthang" && wmctrl -a "newthang"
  xdotool key Control+Shift+t
}

## Set up ZShell Tabs for a Workday
function setupwork() {
  ztitrails
  sleep 0.2
  new_tab && xdotool type ztitpuma && xdotool key Return
  sleep 0.2
  new_tab && xdotool type ztitpsql && xdotool key Return
  sleep 0.2
  new_tab && xdotool type ztitelm && xdotool key Return
  sleep 0.2
  new_tab && xdotool type ztitwrk && xdotool key Return
  sleep 0.2
  xdotool key Control+Page_Down
}

## Destroy zombie PhantomJS processes left around by Wallaby
function kill_phantoms() {
  ps -ef | grep phantomjs | awk '{print $2}' | xargs sudo kill -9
}

## Start VPN connection for ADS
function open_vpn() {
  sudo openvpn --config /home/tm/Documents/thoughtbot/clients/ADS/OVPN/client.ovpn --auth-user-pass
}

## Search Ruby spec directory for biggest file
function spec_most_lines() {
  find spec/ -type f -exec wc -l {} \; | sort -rn | head
}

## Temporarily Increase File Watcher Limit
##
## This is for silly things like obscenely huge
## JavaScript projects (arent they all?), plus
## I refuse to permanently and drastically alter
## my system because JavaScript sucks so bad.
function suchFileWatch() {
  sudo sysctl fs.inotify.max_user_watches=524288
  sudo sysctl -p
}

