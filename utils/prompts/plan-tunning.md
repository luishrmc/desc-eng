# Plano de Ajuste Fino e Governança Estilística do Setup de IA (`plan-tunning.md`)

**Documento:** Plano de Otimização e Refatoração de Prompts, Invariantes e Estilo  
**Data:** 11 de outubro de 2026  
**Status:** Proposta consolidada para revisão do usuário  
**Alvo:** `GEMINI.md`, `.agents/agents/*.md`, `.agents/skills/`, `utils/memory/` e Seções I, II e III  

---

## 1. Sumário Executivo do Diagnóstico

A auditoria textual das três seções redigidas (`secoes/01_introducao.tex`, `secoes/02_fundamentacao.tex` e `secoes/03_metodologia.tex`) revelou desvios estilísticos e estruturais que comprometem a naturalidade e a fluidez da leitura acadêmica. Embora a precisão física e a integridade de referências tenham sido cumpridas, o texto incorporou vícios típicos de geração sintética de modelos de linguagem.

### 1.1 Mapeamento de Sintomas e Trechos Evidenciados

1. **Uso Indevido de Negrito (`\textbf{}`) no Corpo do Texto:**
   - *Ocorrências:* Proliferação sistemática de `\textbf{}` como cabeçalho de itens de listas, transformando parágrafos em resumos de tópicos.
   - *Exemplos Reais:*
     * `secoes/02_fundamentacao.tex` (L191–195): `\item \textbf{Intel 4004 (Unidade Central de Processamento):}`, `\item \textbf{Intel 4001 (Memória ROM e Entrada/Saída):}`.
     * `secoes/02_fundamentacao.tex` (L216–223): `\item \textbf{Subciclo A1 (\textit{Address 1}):}`, `\item \textbf{Subciclo M1 (\textit{Memory 1}):}`.
   - *Impacto:* Quebra da mancha tipográfica homogênea (o padrão visual clássico do IEEE Transactions) e introdução de uma estética de apresentação de slides.

2. **Jargões Empolados, Prolixos e Vocabulário Pseudointelectual de IA:**
   - *Ocorrências:* Inflação vocabular desnecessária, com uso excessivo de construções empoladas e hipérboles conceituais para descrever fatos simples de engenharia.
   - *Exemplos Reais:*
     * `secoes/02_fundamentacao.tex` (L185): *"cuja interconexão apresenta alta heterogeneidade topológica"* (quando bastaria: *roteamento complexo* ou *interconexões irregulares*).
     * `secoes/03_metodologia.tex` (L51): *"obedece a filtros críticos rigorosos"* (quando bastaria: *obedece a critérios de verificação*).
     * `secoes/03_metodologia.tex` (L12, L40): *"confluência interdisciplinar"*, *"protocolo de triangulação epistêmica estruturado em três vértices complementares"*, *"consubstanciada em datas de protocolos"*.
     * Uso redundante e inflado de qualificadores: *"fundamental"*, *"crítico"*, *"essencial"*, *"determinístico"*, *"transcendental"*, muitas vezes empilhados na mesma oração.
   - *Impacto:* Criação de uma barreira artificial de leitura, tornando a prosa pedante e afastando-se do tom pragmático e direto da engenharia eletrônica.

3. **Proliferação Excessiva e Fragmentária de Listas (`itemize` e `enumerate`):**
   - *Ocorrências:* Transformação de raciocínios que deveriam constituir prosa contínua em sequências exaustivas de itens com marcadores.
   - *Exemplos Reais:*
     * `secoes/02_fundamentacao.tex`: 5 blocos de listas em menos de 200 linhas (linhas 103–106, 119–122, 191–196, 201–210 e 215–224), totalizando 24 itens tópicos. A listagem de 8 pinos e de 8 subciclos fragmenta completamente a narrativa.
     * `secoes/03_metodologia.tex`: 2 blocos de listas (linhas 24–29 com 4 itens de patentes, e linhas 52–56 com 3 itens de filtros).
   - *Impacto:* Destruição do ritmo de leitura. O leitor é forçado a interromper o fluxo narrativo para processar tópicos desconectados.

### 1.2 Causa-Raiz na Configuração do Setup
- **Falta de Restrições Negativas Específicas em `GEMINI.md`:** A Seção 6 continha vetos apenas a travessões, ponto e vírgula e adjetivos promocionais ("revolucionário"). Não havia veto a `\textbf{}` nem limitação à quantidade de listas.
- **Filtro da Skill `refine-text` Não Integrado ao Ciclo Fechado:** Embora a *skill* `refine-text` existisse no repositório com excelentes diretrizes ("Prose-First Default", "List Addiction", "False Sophistication"), ela não foi embutida formalmente na rubrica do `technical-critic-agent`. O crítico auditava apenas precisão física e integridade bibliográfica, aprovando textos inflados.

---

## 2. Proposta de Atualização das Invariantes de `GEMINI.md`

Propõe-se substituir a Seção 6 de `GEMINI.md` pela redação a seguir, consolidando as novas regras de estilo:

```markdown
## 6. Restricoes Negativas e Invariantes Comportamentais
- Proibido gerar agentes genericos que unifiquem escrita, compilacao e arbitragem.
- Proibido utilizar travessoes em-dash ("—"), en-dash ("–") ou ponto e virgula (";") na producao de textos.
- Proibido o uso de \textbf{} no corpo da prosa ou em listas. O negrito fica restrito exclusivamente a elementos estruturais padronizados do documento (ex.: cabecalhos de tabela e comandos de secao).
- Proibido o uso de listas (itemize ou enumerate) para narrativas ou explicacoes continuas. O texto deve ser redigido prioritariamente em prosa corrida e paragrafos coesos. O uso de listas fica limitado a no maximo um bloco breve por secao, estritamente quando indispensavel para especificacoes tecnicas formais.
- Proibido o uso de jargoes empolados de IA e academicismos vazios (ex.: "alta heterogeneidade topologica", "filtros criticos rigorosos", "confluencia interdisciplinar", "vertices epistemicos"). Adotar linguagem tecnica natural, direta e humana de engenharia.
- Proibido o uso inflado e desnecessario de termos como "fundamental", "critico" ou "essencial". Esses vocabulos so devem ser empregados quando houver suporte fisico e quantitativo estrito para a afirmacao.
- Proibido transitar entre secoes do artigo sem parecer formal de aprovacao emitido pelo revisor.
```

---

## 3. Reformulação dos Prompts dos Agentes

### 3.1 Patch para `.agents/agents/latex-author-agent.md`
Substituir a Seção 4 ("Diretrizes de Estilo Textual") e a Seção 5 ("Restrições Negativas") pelas seguintes especificações:

```markdown
## 4. Diretrizes de Estilo Textual e Naturalidade (Skill refine-text)
- Redigir prioritariamente em prosa corrida, com paragrafos coesos e bem encadeados de quatro a sete sentencas.
- Eliminar o vicio de fragmentar explicacoes em itens de itemize ou enumerate. Se um conceito puder ser explicado em dois paragrafos, redija em prosa continua.
- Manter tom de engenharia claro, direto e humano. Evitar formulacoes pseudointelectuais ou rebuscadas tipicas de geradores de IA (como "alta heterogeneidade topologica", "filtros criticos rigorosos" ou "vertices epistemicos").
- Moderar o emprego de termos superlativos e enfaticos ("fundamental", "critico", "essencial"). Substitua por relacoes de causa e efeito quantitativas.
- Proibido o uso de \textbf{} no meio de paragrafos ou para destacar o inicio de itens. A enfase deve ser alcancada pela construcao sintatica da frase.
- Preservar o veto absoluto a travessoes (em-dash e en-dash) e ponto e virgula.

## 5. Restricoes Negativas
- Proibido utilizar \textbf{} fora de cabecalhos de tabelas (\toprule).
- Proibido criar mais de um ambiente de lista (itemize/enumerate) por secao.
- Proibido executar comandos no shell ou tentar rodar compiladores diretamente.
- Proibido alterar 00_config.tex ou main.tex sem instrucao expressa do supervisor.
- Proibido incluir chaves de citacao sem registro correspondente no catalogo bibliografico.
```

### 3.2 Patch para `.agents/agents/technical-critic-agent.md`
Atualizar a Seção 2 ("Rubrica de Avaliacao") e a Seção 4 ("Criterios de Aprovacao") para que a naturalidade do texto seja critério de corte:

```markdown
## 2. Rubrica de Avaliacao
O revisor aplica uma rubrica centrada em cinco dimensoes:
1. Fidelidade Fisica: Correcao ao diferenciar o processo MOS com porta de aluminio da tecnologia SGT autoalinhada e PMOS original do Intel 4004.
2. Exatidao Historica: Atribuicao fidedigna de patentes (Bell Labs vs. Fairchild vs. Intel) e papeis dos projetistas (Faggin, Hoff, Mazor, Shima).
3. Naturalidade Textual e Desinflacao de Estilo (refine-text):
   - Inspecao de jargoes empolados e academicismos vazios. Se o texto contiver formulacoes infladas ("alta heterogeneidade topologica", "filtros criticos rigorosos"), a secao devera ser rejeitada ou marcada para reescrita imediata.
   - Verificacao de termos de enfase excessiva ("fundamental", "critico", "essencial"). Exigir reescrita natural quando empregados sem respaldo funcional real.
4. Higiene Tipografica e Estrutural:
   - Presenca de \textbf{} no corpo do texto ou em listas: REJEICAO IMEDIATA.
   - Presenca excessiva de blocos itemize ou enumerate: REJEICAO se houver mais de uma lista ou se a lista fragmentar prosa continua.
   - Presenca de travessoes ou ponto e virgula: REJEICAO IMEDIATA.
5. Integridade de Fontes: Paridade completa de todas as citacoes com pos_textuais/01_referencias.bib.
```

---

## 4. Integração com Skills e Mecanismos Preventivos

### 4.1 Ciclo de Duplo Filtro (Author -> Refine -> Critic)
Atualmente, o fluxo de execução é linear. Para garantir aderência sem retrabalho, o ciclo deve operar em dois filtros complementares:

```
[Evidências do Retriever] 
       │
       ▼
[latex-author-agent] ────► Aplica as diretrizes da skill 'latex-writer' e 'refine-text'
       │                   (Gera prosa contínua sem \textbf{} e sem jargões inflados)
       ▼
[Pre-Compile / Lint] ────► Verifica regras determinísticas antes do build:
       │                   1. Contagem de \textbf{} fora de tabelas (deve ser 0)
       │                   2. Contagem de ';' e travessões (deve ser 0)
       │                   3. Ocorrências de jargões empolados catalogados
       ▼
[latex-compiler-agent] ──► Compilação em lote via latexmk
       │
       ▼
[technical-critic-agent] ─► Auditoria física + Auditoria estilística de naturalidade
```

### 4.2 Atualização em `utils/memory/compilation_heuristics.md` e `critic_rubric_telemetry.md`
- Adicionar ao `compilation_heuristics.md` a regra: *"Ocorrência de `\textbf{}` no corpo do `.tex` é considerada falha estilística pré-compilação."*
- Adicionar ao `critic_rubric_telemetry.md` uma lista negra de jargões empolados a serem reprovados sumariamente durante a leitura crítica.

---

## 5. Roteiro de Retroajuste (*Refactoring*) das Seções I, II e III

Antes de iniciar a redação da Seção IV (Resultados), é essencial executar um ciclo de retroajuste para sanear o texto já produzido e unificar a qualidade editorial do artigo:

### Fase 1: Atualização das Regras do Workspace
1. Aplicar a atualização na Seção 6 de `GEMINI.md`.
2. Aplicar os patches nos prompts de `latex-author-agent.md` e `technical-critic-agent.md`.

### Fase 2: Refatoração da Seção I (`secoes/01_introducao.tex`)
- **Ações:**
  - O texto já é majoritariamente contínuo e equilibrado.
  - Revisar a presença pontual de formulações excessivamente enfáticas.
  - Confirmar zero ocorrências de `\textbf{}`.

### Fase 3: Refatoração da Seção II (`secoes/02_fundamentacao.tex`)
- **Ações Críticas:**
  - **Eliminar listas desnecessárias:**
    * Converter a enumeração da orientação $\langle 111 \rangle$ e $\langle 100 \rangle$ (L119–122) em um único parágrafo fluido de comparação.
    * Converter a lista dos 4 chips da família MCS-4 (L191–195) em um parágrafo narrativo bem encadeado, removendo os `\textbf{Intel 400X:}`.
    * Converter a listagem de pinos (L201–210) e a lista dos 8 subciclos (L215–224) em dois parágrafos contínuos, reservando a enumeração apenas para os subciclos de forma compacta e sem negrito.
  - **Remover todos os `\textbf{}`:** Substituir a ênfase visual pelo fluxo lógico da frase.
  - **Desinflar jargões:** Substituir *"alta heterogeneidade topológica"* por *"interconexão com rotas irregulares"*; simplificar termos como *"elevação capacitiva dinâmica de potencial"* para formulações mais diretas.

### Fase 4: Refatoração da Seção III (`secoes/03_metodologia.tex`)
- **Ações Críticas:**
  - **Converter as patentes em texto corrido:** Fundir os 4 itens da lista de patentes (L24–29) em dois parágrafos contínuos narrando a sucessão cronológica entre Bell Labs, Fairchild e Intel, sem `\textbf{}`.
  - **Desinflar o vocabulário metodológico:**
    * Substituir *"confluência entre a física de semicondutores"* por *"relação entre a física de semicondutores"*.
    * Substituir *"filtros críticos rigorosos"* (L51) por *"critérios de verificação"*.
    * Suprimir a terminologia rebuscada de *"vértices epistêmicos"* no texto e na legenda da Figura 3, descrevendo simplesmente as três fontes de dados da pesquisa (modelagem física, documentos da época e relatos orais).
  - **Eliminar a lista de critérios (L52–56):** Escrever em forma de parágrafo explicativo.

### Fase 5: Compilação e Reavaliação Final
- Executar `latexmk` isolado em `out/` após cada refatoração.
- Submeter cada seção refatorada ao `technical-critic-agent` para emissão do parecer formal atualizado.
