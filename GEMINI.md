# Diretrizes do Sistema: Artigo Academico Federico Faggin e Intel 4004

## 1. Escopo do Projeto e Arquitetura do Workspace
Este workspace hospeda o desenvolvimento de um artigo academico sobre a contribuicao tecnica de Federico Faggin no desenvolvimento da tecnologia de porta autoalinhada de silicio (Silicon Gate Technology, SGT) e na viabilizacao fisica do microprocessador comercial Intel 4004. O texto examina a transicao de circuitos integrados com porta metalica de aluminio para silicio policristalino, detalha a reducao de capacitancias parasitas e analisa os reflexos dessa mudanca estrutural na integracao de sistemas em pastilha unica.

Organizacao de pastas do repositorio:
- `00_config.tex`: Declaracao de pacotes, definicao de estilos e parametros tipograficos globais.
- `main.tex`: Arquivo de entrada principal que organiza a inclusao das secoes textuais.
- `secoes/`: Arquivos `.tex` correspondentes a cada subdivisao do artigo.
- `pos_textuais/01_referencias.bib`: Catalogo de fontes bibliograficas e citacoes.
- `img/`: Vetores, esquematicos e figuras dos dispositivos semicondutores.
- `utils/memory/`: Sistema de memoria cognitiva tripartite (caches, heuristicas, auditorias e episodios relacionais).
- `utils/docs/`: Fontes documentais primarias, patentes e artigos historicos coletados.
- `out/`: Diretorio de saida isolado para artefatos gerados pelo compilador LaTeX.

## 2. Topologia Multi-Agente e Arquitetura de Loops Hierarquicos (Dual-Loop)
O desenvolvimento opera sob uma arquitetura hierarquica em dois niveis com cinco agentes especializados:
1. `orchestrator-agent` (Modelo: pro): Coordenacao do DAG global, despacho de frentes paralelas e gerenciamento do Outer Loop.
2. `retriever-agent` (Modelo: flash): Extracao de deltas conceituais e mapeamento de reuso matematico a partir de `utils/docs/`.
3. `latex-author-agent` (Modelo: pro): Redacao em prosa continua e operacao do Inner Loop de auto-correcao sintatica.
4. `latex-compiler-agent` (Modelo: flash): Compilacao nao-interativa e geracao de telemetria estruturada em `out/`.
5. `technical-critic-agent` (Modelo: pro): Auditoria adversarial de rigor fisico, historico e anti-redundancia no Outer Loop.

Dinamica dos Loops:
- **Inner Loop (Sintaxe e Estilo):** O redator itera diretamente com o linter local (`latex-style-linter.sh`) e o compilador ate zerar erros e advertencias, sem acionar o revisor senior.
- **Outer Loop (Semantica e Epistemologia):** Acionado exclusivamente sobre versoes com exit code 0 e linter aprovado, registrando licoes aprendidas na Memoria Episodica Relacional em `utils/memory/episodes/`.
- **Despacho Concorrente Disjunto:** O orquestrador despacha multiplas frentes paralelas de trabalho onde cada redator opera com propriedade exclusiva de um arquivo `.tex`, sincronizando em barreira unica.

## 3. Sistema de Memoria Cognitiva Tripartite
- **Memoria Semantica:** Base de regras invariantes e catalogo canonico `pos_textuais/01_referencias.bib`.
- **Memoria Procedural:** Heuristicas operacionais em `utils/memory/compilation_heuristics.md` e scripts de validacao em `.agents/hooks/`.
- **Memoria Episodica Relacional:** Trilhas indexadas em `utils/memory/episodes/` com frontmatter YAML, tags ontologicas hierarquicas e arestas de causalidade (`references_eq`, `supersedes`, `addressed_by`).

## 4. Governanca de Seguranca e Isolamento de Escrita
- Modificacao de arquivos `.tex` em `secoes/`: Permitida exclusivamente ao `latex-author-agent`. Em execucoes paralelas, cada agente recebe permissao restrita a um unico arquivo alvo.
- Comandos de compilacao no terminal: Permitidos exclusivamente ao `latex-compiler-agent`.
- Comandos de reversao de codigo e sincronizacao git: Restritos ao `orchestrator-agent`.
- Agentes de consulta (`retriever-agent` e `technical-critic-agent`) operam em modo estritamente de leitura.

## 5. Fluxos de Trabalho e Validacao Preventiva
- Linting estilistico preventivo (executado antes de qualquer compilacao):
  ```bash
  bash .agents/hooks/latex-style-linter.sh secoes/
  ```
- Compilacao completa do artigo:
  ```bash
  latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=out main.tex
  ```
- Limpeza de arquivos temporarios:
  ```bash
  latexmk -C -outdir=out main.tex
  ```
- Auditoria de estado do repositorio:
  ```bash
  git status --porcelain
  ```
- Reversao de secao com falha de convergencia:
  ```bash
  git checkout HEAD -- secoes/XX_secao_alvo.tex
  ```

## 6. Restricoes Negativas e Invariantes Comportamentais (Tolerancia Zero)
- Proibido gerar agentes genericos que unifiquem escrita, compilacao e arbitragem.
- **Protocolo Anti-Redundancia Intercapitular:** Proibido re-deduzir ou reapresentar blocos de equacoes matematicas ja formalizados em secoes anteriores. Modelos de capacitancia, limiar e atraso introduzidos na Fundamentacao Teórica devem ser referenciados nas secoes posteriores estritamente por meio de rotulos cruzados (`\cref{eq:...}`).
- Proibido utilizar travessoes em-dash ("—"), en-dash ("–") ou ponto e virgula (";") na producao de textos em portugues.
- Proibido o uso de `\textbf{}` no corpo da prosa ou em listas. O negrito fica restrito exclusivamente a cabecalhos de tabela e comandos estruturais de secao.
- Proibido o uso de listas (itemize ou enumerate) para narrativas continuas. O texto deve ser redigido prioritariamente em prosa corrida e paragrafos coesos. O uso de listas fica limitado a no maximo um bloco breve por secao, estritamente quando indispensavel para especificacoes tecnicas formais.
- Proibido o uso de jargoes empolados de IA e academicismos vazios (ex.: "alta heterogeneidade topologica", "filtros criticos rigorosos", "confluencia interdisciplinar", "vertices epistemicos"). Adotar linguagem tecnica natural, direta e humana de engenharia.
- Proibido o uso inflado e desnecessario de termos superlativos como "fundamental", "critico", "essencial", "revolucionario", "astronomicos", "impressionante" ou "divisor de aguas".
- Proibido transitar entre etapas do artigo sem parecer formal de aprovacao emitido pelo revisor.
