#!/bin/bash

if [ ! "$(which inkscape 2> /dev/null)" ]; then
  echo inkscape needs to be installed to generate the png.
  exit 1
fi

if [ ! "$(which optipng 2> /dev/null)" ]; then
  echo optipng needs to be installed to generate the png.
  exit 1
fi

gtk3() (
  cd src/gtk-3.0/gtk-common
  rm assets/*.png
  ./render-assets.sh
)

gtk2() (
  cd src/gtk-2.0
  rm assets/*.png
  ./render-assets.sh
)

case "${1}" in
  "")
    gtk3
    gtk2
    ;;
  gtk3)
    gtk3
    ;;
  gtk2)
    gtk2
    ;;
  *)
    echo "Unknown argument: '${1}'"
    echo "Use 'gtk3', or 'gtk2' as an argument."
    ;;
esac
