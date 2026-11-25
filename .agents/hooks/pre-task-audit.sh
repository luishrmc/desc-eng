#!/usr/bin/env bash
set -euo pipefail

# Pre-task hook: valida se a working tree do git (exceto artefatos de build em out/) esta limpa.
STATUS=$(git status --porcelain -- ':!out/' || true)

if [ -n "$STATUS" ]; then
  echo "[ERRO][pre-task-audit] O repositorio possui alteracoes nao comitadas fora de out/:" >&2
  echo "$STATUS" >&2
  echo "[ERRO][pre-task-audit] Limpe ou comite as alteracoes pendentes antes de iniciar o ciclo." >&2
  exit 1
fi

echo "[OK][pre-task-audit] Working tree limpa (fora de out/). Loop autorizado."
exit 0
