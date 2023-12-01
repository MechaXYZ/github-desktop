#!/bin/bash

NEEDED="tigervnc-tools"

if [ $(dpkg-query -W -f='${Status}' $NEEDED 2>/dev/null | grep -c "ok installed") == 0 ]; then
  echo "Unable to find package '$NEEDED.' Setting up $NEEDED."
  sudo apt-get --yes install $NEEDED

  echo "Installing firefox-esr and libpci-dev as firefox needs the snap version and google-chrome is buggy."
  sudo add-apt-repository --yes ppa:mozillateam/ppa
  sudo apt-get --yes install firefox-esr libpci-dev
fi

DIR="/opt/novnc/utils/novnc_proxy"

if [ ! -f $DIR ]; then
    echo "$DIR not found. Reinstall noVNC and try again."
    exit
fi

tigervncserver :0 -SecurityTypes None -rfbport 5901
/opt/novnc/utils/novnc_proxy --vnc localhost:5901 --listen localhost:6080 && echo "Go to port 6080 to view your desktop." &
