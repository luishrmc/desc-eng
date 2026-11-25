#!/usr/bin/env bash
set -euo pipefail

# svg2pdf.sh: Converte SVG em PDF vetorial recortado e gera preview PNG para inspecao visual.
# Uso:
#   bash .agents/scripts/svg2pdf.sh img/meu_diagrama.svg
#   bash .agents/scripts/svg2pdf.sh --clean img/meu_diagrama.svg

CLEAN_ONLY=0
if [ "${1:-}" = "--clean" ]; then
  CLEAN_ONLY=1
  shift
fi

INPUT_SVG="${1:-}"
if [ -z "$INPUT_SVG" ]; then
  echo "[ERRO][svg2pdf] Informe o caminho do SVG (ex.: img/diagrama.svg)." >&2
  exit 1
fi

BASENAME="$(basename "$INPUT_SVG" .svg)"
DIRNAME="$(dirname "$INPUT_SVG")"
RAW_PDF="out/${BASENAME}_raw.pdf"
OUT_PDF="${DIRNAME}/${BASENAME}.pdf"
PREVIEW_PREFIX="out/preview_${BASENAME}"

if [ "$CLEAN_ONLY" -eq 1 ]; then
  rm -f "$RAW_PDF" "${PREVIEW_PREFIX}"*.png
  echo "[OK][svg2pdf] Temporarios removidos para $BASENAME."
  exit 0
fi

if [ ! -f "$INPUT_SVG" ]; then
  echo "[ERRO][svg2pdf] Arquivo nao encontrado: $INPUT_SVG" >&2
  exit 1
fi

mkdir -p out
google-chrome --headless --no-sandbox --disable-gpu --print-to-pdf="$RAW_PDF" --no-pdf-header-footer "$INPUT_SVG" >/dev/null 2>&1
pdfcrop "$RAW_PDF" "$OUT_PDF" >/dev/null
rm -f "$RAW_PDF"
pdftoppm -png -r 150 "$OUT_PDF" "$PREVIEW_PREFIX"

echo "[OK][svg2pdf] PDF vetorial gerado: $OUT_PDF"
pdfinfo "$OUT_PDF" | grep -E 'Pages|Page size|File size' || true
ls -lh "${PREVIEW_PREFIX}"*.png
