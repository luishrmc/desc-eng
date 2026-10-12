#!/usr/bin/env bash
set -euo pipefail

# latex-style-linter.sh: Varredura deterministica de restricoes negativas em secoes LaTeX
TARGET_DIR="${1:-secoes}"
FAIL=0

mkdir -p out
echo "[LINTER][INFO] Iniciando verificacao estrita de estilo em $TARGET_DIR..."

# 1. Checagem de ponto e virgula no corpo do texto
if grep -n ';' "$TARGET_DIR"/*.tex > out/linter_semicolon.log 2>/dev/null; then
  echo "[LINTER][ERRO] Ponto e virgula detectado nos arquivos:" >&2
  cat out/linter_semicolon.log >&2
  FAIL=1
fi

# 2. Checagem de travessoes em-dash ou en-dash
if grep -Pn '[—–]' "$TARGET_DIR"/*.tex > out/linter_dashes.log 2>/dev/null; then
  echo "[LINTER][ERRO] Travessoes (em-dash/en-dash) detectados:" >&2
  cat out/linter_dashes.log >&2
  FAIL=1
fi

# 3. Checagem de \textbf{} no corpo do texto (exceto cabecalhos de tabela contendo & ou \\)
if grep -n '\\textbf{' "$TARGET_DIR"/*.tex | grep -v '&' | grep -v '\\\\' > out/linter_textbf.log 2>/dev/null; then
  echo "[LINTER][ERRO] Uso indevido de \\textbf{} no corpo do texto:" >&2
  cat out/linter_textbf.log >&2
  FAIL=1
fi

# 4. Checagem de termos promocionais e jargoes proibidos
PROHIBITED_TERMS="revolucionario|divisor de aguas|alta heterogeneidade topologica|filtros criticos rigorosos|confluencia interdisciplinar|vertices epistemicos|astronomicos|impressionante"
if grep -Eini "$PROHIBITED_TERMS" "$TARGET_DIR"/*.tex > out/linter_jargon.log 2>/dev/null; then
  echo "[LINTER][ERRO] Termos promocionais ou jargoes proibidos detectados:" >&2
  cat out/linter_jargon.log >&2
  FAIL=1
fi

if [ "$FAIL" -eq 1 ]; then
  echo "[LINTER][FALHA] Violacoes de estilo detectadas. Corrija os arquivos antes de compilar." >&2
  exit 1
fi

echo "[LINTER][SUCESSO] Todos os arquivos estao em plena conformidade com as invariantes de estilo."
exit 0
