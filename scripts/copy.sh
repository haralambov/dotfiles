#!/usr/bin/env bash
set -euo pipefail

# Usage: clip FILE        # copy file contents
#        cmd | clip -     # copy from stdin

if [ $# -lt 1 ]; then
  echo "Usage: $(basename "$0") <file|->" >&2
  exit 2
fi

SRC="$1"
# Ensure source is readable (unless stdin)
if [ "$SRC" != "-" ] && [ ! -r "$SRC" ]; then
  echo "Error: cannot read '$SRC'" >&2
  exit 1
fi

if command -v wl-copy >/dev/null 2>&1; then
  # wl-copy reads stdin; --trim-newline avoids an extra newline at the end
  if [ "$SRC" = "-" ]; then
    wl-copy --trim-newline
  else
    wl-copy --trim-newline < "$SRC"
  fi
  exit 0
fi

if command -v xclip >/dev/null 2>&1; then
  # xclip can take a file argument or stdin
  if [ "$SRC" = "-" ]; then
    xclip -selection clipboard -i
  else
    xclip -selection clipboard -i "$SRC"
  fi
  exit 0
fi

if command -v xsel >/dev/null 2>&1; then
  if [ "$SRC" = "-" ]; then
    xsel --clipboard --input
  else
    xsel --clipboard --input < "$SRC"
  fi
  exit 0
fi

echo "No clipboard tool found (install wl-clipboard or xclip/xsel)." >&2
exit 1
