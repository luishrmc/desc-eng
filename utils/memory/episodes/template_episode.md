---
episode_id: "EP-YYYYMMDD-SECXX-REVYY"
timestamp: "YYYY-MM-DDTHH:MM:SSZ"
target_file: "secoes/XX_secao_alvo.tex"
agent: "latex-author-agent"
evaluator: "technical-critic-agent"
iteration: 1
outcome: "pending_fix" # [success, rejected, pending_fix]
severity: "cosmetic" # [cosmetic, moderate, critical]

tags:
  - "#domain/physics/capacitance"
  - "#flaw/style/bold-inline"
  - "#fix/sobriety-rewrite"
  - "#build/exit-0"

relations:
  supersedes: null
  depends_on: "secoes/02_fundamentacao.tex"
  addressed_by: null
  references_eq:
    - "eq:cox"
    - "eq:cov"
    - "eq:vth_expandido"

metrics:
  word_count_delta: 0
  compilation_exit_code: 0
  overfull_hbox_count: 0
---

# Diagnóstico Técnico e Parecer da Iteração

## 1. Contexto Operacional e Metas do Ciclo
Descrever o escopo de redação ou refatoração executado nesta iteração.

## 2. Diagnóstico de Desvios e Falhas Identificadas
Registrar explicitamente as causas-raiz de eventuais rejeições ou advertências geradas pelo Inner Loop ou Outer Loop.

## 3. Ações Corretivas Requeridas (Actionable Diff Patch)
Instruções precisas para o `latex-author-agent` corrigir a seção no ciclo subsequente.
