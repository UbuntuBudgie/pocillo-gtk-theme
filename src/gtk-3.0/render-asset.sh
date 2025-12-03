#!/bin/bash
set -ueo pipefail

FORCE_INKSCAPE="$(echo "${FORCE_INKSCAPE-False}" | tr '[:upper:]' '[:lower:]')"
if [[ "${FORCE_INKSCAPE}" == "true" ]]; then
  RENDER_SVG=""
else
  RENDER_SVG="$(command -v rendersvg)" || true
fi
INKSCAPE="$(command -v inkscape)" || true
OPTISVG="$(command -v optisvg)" || true

if [[ -n "${INKSCAPE}" ]]; then
  if "$INKSCAPE" --help | grep -e "--export-filename" > /dev/null; then
    EXPORT_FILE_OPTION="--export-filename"
  elif "$INKSCAPE" --help | grep -e "--export-file" > /dev/null; then
    EXPORT_FILE_OPTION="--export-file"
  elif "$INKSCAPE" --help | grep -e "--export-svg" > /dev/null; then
    EXPORT_FILE_OPTION="--export-svg"
  fi
fi

SRC_FILE="assets.svg"
ASSETS_DIR="assets"

i="$1"

echo "Rendering '$ASSETS_DIR/$i.svg'"

if [[ -n "${RENDER_SVG}" ]]; then
  "$RENDER_SVG" --export-id "$i" \
                "$SRC_FILE" "$ASSETS_DIR/$i.svg"
else
  "$INKSCAPE" --export-id="$i" \
              --export-id-only \
              "$EXPORT_FILE_OPTION=$ASSETS_DIR/$i.svg" "$SRC_FILE" >/dev/null
fi

if [[ -n "${OPTISVG}" ]]; then
  "$OPTISVG" -o7 --quiet "$ASSETS_DIR/$i.svg"
fi

echo "Rendering '$ASSETS_DIR/$i@2.svg'"

if [[ -n "${RENDER_SVG}" ]]; then
  # @TODO: remove --zoom when it will be fixed/implemented in resvg
  "$RENDER_SVG" --export-id "$i" \
                --dpi 192 \
                --zoom 2 \
                "$SRC_FILE" "$ASSETS_DIR/$i@2.svg"
else
  "$INKSCAPE" --export-id="$i" \
              --export-id-only \
              --export-dpi=192 \
              "$EXPORT_FILE_OPTION=$ASSETS_DIR/$i@2.svg" "$SRC_FILE" >/dev/null
fi

if [[ -n "${OPTISVG}" ]]; then
  "$OPTISVG" -o7 --quiet "$ASSETS_DIR/$i@2.svg"
fi
