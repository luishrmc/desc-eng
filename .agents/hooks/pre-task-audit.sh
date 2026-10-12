#!/usr/bin/env bash
set -euo pipefail

# Pre-task hook: valida se a working tree do git esta limpa antes de iniciar o loop de uma nova secao.
STATUS=$(git status --porcelain)

if [ -n "$STATUS" ]; then
  echo "[ERRO][pre-task-audit] O repositorio possui alteracoes nao comitadas:" >&2
  echo "$STATUS" >&2
  echo "[ERRO][pre-task-audit] Limpe ou comite as alteracoes pendentes antes de iniciar o ciclo." >&2
  exit 1
fi

echo "[OK][pre-task-audit] Working tree limpa. Loop autorizado."
exit 0
