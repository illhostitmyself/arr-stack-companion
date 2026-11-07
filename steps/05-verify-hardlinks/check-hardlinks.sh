#!/usr/bin/env bash
# Run this yourself, on the host or inside the Sonarr container, after a torrent import.
# Usage: ./check-hardlinks.sh /data/torrents/tv/<release>/<file> /data/media/tv/<show>/<season>/<file>
# Read-only: it only lists inodes and disk use.
set -euo pipefail

if [ "$#" -ne 2 ]; then
  echo "usage: $0 <file-in-downloads> <file-in-media>" >&2
  exit 1
fi
src=$1
dst=$2

ls -li "$src" "$dst"
echo
echo "Same inode number and link count 2 means hardlinked."
inode=$(stat -c %i "$src")
echo "Every path sharing inode $inode under $(dirname "$src")/../..:"
find "$(dirname "$(dirname "$src")")/.." -xdev -inum "$inode" 2>/dev/null || true
echo
du -ch "$src" "$dst" | tail -n 1
echo "(du counts a hardlinked file once; after a real copy it doubles.)"
