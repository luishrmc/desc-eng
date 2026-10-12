# Memória Metaoperacional de Tuning do Sistema (`system_tuning_insights.md`)

Este arquivo consolida oportunidades de aprimoramento contínuo nas instruções de sistema dos agentes, políticas de permissão de ferramentas, modularidade de *skills* e pontos de interceptação de *hooks*.

---

## 1. Otimizações de Latência e Contexto (Memory Management)
- **Problema Observado:** Subagentes repetiam consultas exaustivas de fatos e equações a cada iteração, gerando latência elevada de tokens e tempo de execução desnecessário.
- **Solução Implementada:** Separação explícita entre pesquisa de fatos (gravada em cache persistente Markdown no diretório `utils/memory/`) e redação textual. Subagentes de redação e revisão agora consultam diretamente o cache local antes de qualquer inferência externa.
- **Impacto Comprovado na Seção III:** Graças ao pré-carregamento de `research_cache_metodologia.md` e à consulta preventiva a `compilation_heuristics.md`, o ciclo convergiu na **Iteração 1** sem nenhum erro fatal de compilação ou rejeição técnica.

---

## 2. Ajuste Fino de Prompts e Definições dos Agentes
- **`latex-author-agent`:** A diretiva explícita de consultar `compilation_heuristics.md` impediu a reincidência de sublinhados não escapados em caminhos de figuras e garantiu o formato correto de listas sem ponto e vírgula. Manter esse protocolo ativo nas seções IV, V e VI.
- **`technical-critic-agent`:** O uso de `critic_rubric_telemetry.md` agilizou a auditoria de atribuição de patentes (Bell Labs vs. Fairchild vs. Intel) e o checklist de regras negativas, gerando pareceres unificados e determinísticos.
- **`retriever-agent`:** Manter a persistência das evidências em arquivos temáticos (`research_cache_XX.md`), atuando estritamente em modo de leitura para proteger a integridade do repositório.

---

## 3. Recomendações para Hooks e Guardrails
- **Pre-Compile Hook (Linter Estilístico):** Implementar script leve em Python ou Bash interceptando o comando de build para inspecionar regex de ponto e vírgula (`;`), travessões (`—` e `–`) ou adjetivos proibidos antes do acionamento do `latexmk`.
- **Pre-Commit Hook (Integridade Referencial):** Validar a paridade entre chaves `\cite{}` inseridas no `.tex` e os blocos correspondentes em `pos_textuais/01_referencias.bib`.
