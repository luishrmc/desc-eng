#!/usr/bin/env bash
set -euo pipefail

# Post-write hook: compila o documento de forma deterministica apos alteracao em secoes/
echo "[INFO][post-write-compile] Iniciando compilacao de verificacao com latexmk..."

mkdir -p out

if latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=out main.tex > out/compile_hook.log 2>&1; then
  echo "[OK][post-write-compile] Compilacao bem-sucedida. PDF gerado em out/main.pdf."
  exit 0
else
  EXIT_CODE=$?
  echo "[ERRO][post-write-compile] Falha de compilacao com codigo $EXIT_CODE." >&2
  echo "[ERRO][post-write-compile] Ultimas 20 linhas do log:" >&2
  tail -n 20 out/compile_hook.log >&2
  exit "$EXIT_CODE"
fi
