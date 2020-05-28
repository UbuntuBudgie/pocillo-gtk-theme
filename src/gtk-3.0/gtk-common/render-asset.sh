#! /bin/bash
set -ueo pipefail

INKSCAPE="$(which inkscape)"
OPTIPNG="$(which optipng)"

SRC_FILE="assets.svg"
ASSETS_DIR="assets"

i=${1}

INKVER=`$INKSCAPE --version 2> /dev/null | cut -d' ' -f2 | cut -d'.' -f1`
if [[ $INKVER == 0 ]];
then
	EXPORT_TYPE="--export-png"
else
	EXPORT_TYPE="--export-filename"
fi


if [ -f $ASSETS_DIR/$i.png ]; then
    echo $ASSETS_DIR/$i.png exists.
else
    echo Rendering $ASSETS_DIR/$i.png
    $INKSCAPE --export-id=$i \
              --export-id-only \
              $EXPORT_TYPE=$ASSETS_DIR/$i.png $SRC_FILE >/dev/null \
    && $OPTIPNG -o7 --quiet $ASSETS_DIR/$i.png
fi
if [ -f $ASSETS_DIR/$i@2.png ]; then
    echo $ASSETS_DIR/$i@2.png exists.
else
    echo Rendering $ASSETS_DIR/$i@2.png
    $INKSCAPE --export-id=$i \
              --export-dpi=192 \
              --export-id-only \
              $EXPORT_TYPE=$ASSETS_DIR/$i@2.png $SRC_FILE >/dev/null \
    && $OPTIPNG -o7 --quiet $ASSETS_DIR/$i@2.png
fi

exit 0
