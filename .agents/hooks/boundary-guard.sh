#!/usr/bin/env bash
set -euo pipefail

# Boundary-guard hook: bloqueia alteracoes em arquivos centrais ou fora da secao alvo autorizada.
TARGET_SECTION="${1:-}"

if [ -z "$TARGET_SECTION" ]; then
  echo "[AVISO][boundary-guard] Nenhuma secao alvo especificada para verificacao de fronteira."
  exit 0
fi

MODIFIED_FILES=$(git diff --name-only -- ':!out/')

for file in $MODIFIED_FILES; do
  if [ "$file" = "00_config.tex" ] || [ "$file" = "main.tex" ]; then
    echo "[ERRO][boundary-guard] Modificacao nao autorizada no arquivo central $file." >&2
    exit 1
  fi
  if [[ "$file" == secoes/*.tex ]] && [ "$file" != "$TARGET_SECTION" ]; then
    echo "[ERRO][boundary-guard] Alteracao fora do alvo exclusivo ($TARGET_SECTION): $file" >&2
    exit 1
  fi
done

echo "[OK][boundary-guard] Alteracoes em conformidade com as fronteiras estabelecidas."
exit 0
