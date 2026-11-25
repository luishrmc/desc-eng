---
episode_id: "EP-20261125-AI-SETUP-REFINEMENT"
timestamp: "2026-11-25T11:10:30-03:00"
target_file: "GEMINI.md"
agent: "orchestrator-agent"
evaluator: "orchestrator-agent"
iteration: 1
outcome: "success"
severity: "minor"

tags:
  - "#fix/ai-setup-alignment"
  - "#fix/svg-pipeline-automation"
  - "#fix/linter-siunitx-figure-star"
  - "#build/exit-0"

relations:
  supersedes: "EP-20261125-FIGURAS-DUAS-COLUNAS"
  depends_on: ".agents/manifest.json"
  addressed_by: null
  references_eq: []

metrics:
  critic_score: 9.9
  compilation_exit_code: 0
  overfull_hbox_tex: 0
  underfull_hbox_count: 0
  pdf_pages: 16
---

# Refinamento do Setup de IA, Skills, Agents, Hooks e Memória Procedural

## 1. Contexto e Lições Aprendidas
Após a entrega do manuscrito de 16 páginas com 17 figuras em coluna única (`\columnwidth`), foi realizada auditoria completa do ecossistema `.agents/`, `GEMINI.md` e `utils/memory/` para alinhar as especificações teóricas à execução real no Antigravity CLI (`agy`).

## 2. Melhorias Implementadas na Branch `main`
- **Scripts Determinísticos (`.agents/scripts/`):**
  - Criado `svg2pdf.sh` (Chrome headless + `pdfcrop` + `pdftoppm` + limpeza `--clean`) para padronizar a criação e inspeção visual de figuras SVG em `\columnwidth`.
  - Criado `audit-build.py` (`--strict --json`) para verificar `0` `figure*`, `0` imagens ausentes, integridade `\label{}`/`\cref{}` e `.bib`, e telemetria de `out/main.log` e `out/main.blg`.
- **Hooks (`.agents/hooks/`):**
  - `latex-style-linter.sh`: adicionados bloqueios determinísticos para `\begin{figure*}`, ponto decimal em `\SI`/`\SIrange`, `\text{...}` dentro de `\SIrange`, além de alerta não bloqueante para superlativos moderados.
  - `pre-task-audit.sh` e `boundary-guard.sh`: ignoram `out/` e validam isolamento estrito entre arquivos de `secoes/*.tex`.
  - `post-write-compile.sh`: integrado com `python3 .agents/scripts/audit-build.py --strict`.
- **Agentes e Manifest (`.agents/manifest.json`, `.agents/agents/*.md`, `GEMINI.md`):**
  - Corrigidos nomes de ferramentas para o runtime CLI (`read_file`, `write_file`, `edit_file`, `run_command`, `search_web`), removida a skill inexistente `search-retriever`, corrigido caminho `utils/aulas/**`, e definida política de reciclagem de subagentes (`N <= 3` rodadas) para evitar saturação de cache (`> 300k` tokens).
- **Skills (`.agents/skills/`):**
  - Criada [svg-figure-pipeline](file:///home/luis/ufmg/desc-eng/artigo/.agents/skills/svg-figure-pipeline/SKILL.md).
  - Atualizadas `latex-writer`, `latex-build`, `academic-review`, `bib-validator`, `git-commit-stager` e `git-safety-guard`.
- **Memória e Higiene:**
  - Corrigida a linha 15 de `utils/memory/compilation_heuristics.md` (espaçamento em `\SIrange`) e adicionadas heurísticas de coluna única, `retain-explicit-plus` e `aligned`.
  - Removida a entrada órfã `faggin1969patent` de `pos_textuais/01_referencias.bib` (`29/29` entradas citadas, `0` órfãs) e removidos do índice Git os arquivos auxiliares de `out/` mantendo `out/main.pdf` atualizado.
