#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "usage: bash reconstruct.sh /path/to/output-dir" >&2
  exit 1
fi

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUT_DIR="$1"
mkdir -p "$OUT_DIR"

rebuild() {
  local archive="$1"
  cat "$ROOT_DIR"/chunks/"${archive}".part-* > "$OUT_DIR/$archive"
}

rebuild "ta1-cadets-e3-official.json.tar.gz"
rebuild "ta1-cadets-e3-official-1.json.tar.gz"
rebuild "ta1-cadets-e3-official-2.json.tar.gz"

(cd "$OUT_DIR" && sha256sum -c "$ROOT_DIR/manifest.sha256")
