#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "usage: bash reconstruct_models.sh /path/to/output-dir" >&2
  exit 1
fi

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUT_DIR="$1"
mkdir -p "$OUT_DIR"

cat "$ROOT_DIR"/model_chunks/cadets3_models.pt.part-* > "$OUT_DIR/cadets3_models.pt"
(cd "$OUT_DIR" && sha256sum -c "$ROOT_DIR/model_manifest.sha256")
