#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "usage: bash reconstruct_theia.sh /path/to/output-dir" >&2
  exit 1
fi

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUT_DIR="$1"
mkdir -p "$OUT_DIR"

rebuild() {
  local archive="$1"
  cat "$ROOT_DIR"/theia_chunks/"${archive}".part-* > "$OUT_DIR/$archive"
}

rebuild "ta1-theia-e3-official-1r.json.tar.gz"
rebuild "ta1-theia-e3-official-3.json.tar.gz"
rebuild "ta1-theia-e3-official-5m.json.tar.gz"
rebuild "ta1-theia-e3-official-6r.json.tar.gz"

(cd "$OUT_DIR" && sha256sum -c "$ROOT_DIR/theia_manifest.sha256")
