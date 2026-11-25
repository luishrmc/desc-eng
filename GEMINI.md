# Diretrizes do Sistema: Artigo Academico Federico Faggin e Intel 4004

## 1. Escopo do Projeto e Arquitetura do Workspace
Este workspace hospeda o desenvolvimento de um artigo academico em formato IEEE duas colunas sobre a contribuicao tecnica de Federico Faggin na tecnologia de porta autoalinhada de silicio (Silicon Gate Technology, SGT) e na viabilizacao fisica do microprocessador comercial Intel 4004.

Organizacao de pastas do repositorio:
- `00_config.tex`: Pacotes, `siunitx` (`output-decimal-marker = {,} `, `retain-explicit-plus = true`), `cleveref` e metadados globais.
- `main.tex`: Arquivo mestre estrutural que organiza as secoes e a bibliografia.
- `secoes/`: Arquivos `.tex` modulares (`00_resumo.tex` a `06_conclusao.tex`).
- `pos_textuais/01_referencias.bib`: Catalogo canonico de fontes bibliograficas.
- `img/`: Diagramas vetoriais em coluna unica (`.svg`, `.tex` e seus `.pdf` recortados).
- `utils/aulas/` e `utils/docs/`: Materiais de aula (`Aula1.pdf` a `Aula10.pdf`) e fontes documentais coletadas.
- `utils/memory/`: Sistema de memoria cognitiva tripartite (`compilation_heuristics.md`, `critic_rubric_telemetry.md`, caches e episodios relacionais em `episodes/`).
- `.agents/scripts/`: Utilitarios deterministicos (`svg2pdf.sh` e `audit-build.py`).
- `out/`: Diretorio isolado para compilacao (`main.pdf`, logs e previas temporarias `out/pages/`).

## 2. Topologia Multi-Agente, Dual-Loop e Ciclo de Vida
O desenvolvimento opera em arquitetura hierarquica de dois niveis com cinco agentes definidos em `.agents/manifest.json` e `.agents/agents/*.md`:
1. `orchestrator-agent` (`pro`): Coordenacao do DAG, despacho concorrente disjunto, gestao de Git e reciclagem de subagentes.
2. `retriever-agent` (`flash`): Extracao de deltas conceituais, mapeamento de `\cref{}` e auditoria documental.
3. `latex-author-agent` (`pro`): Redacao em prosa continua, criacao/conversao de SVGs em `\columnwidth` (`svg-figure-pipeline`), checagem visual PNG e linter local.
4. `latex-compiler-agent` (`flash`): Compilacao limpa (`latexmk`), auditoria deterministica (`audit-build.py --strict`) e renderizacao seletiva `pdftoppm`.
5. `technical-critic-agent` (`pro`): Auditoria adversarial de fisica, historiografia, anti-redundancia e layout visual nas paginas PNG.

Dinamica e eficiencia dos loops:
- **Inner Loop:** O redator gera/ajusta texto e SVGs (`svg2pdf.sh` + leitura do PNG) e valida com `latex-style-linter.sh`. Na barreira global, o compilador executa `latexmk` + `audit-build.py --strict`.
- **Outer Loop:** Acionado apenas sobre versoes com exit code 0 e `audit-build.py --strict` aprovado, registrando licoes em `utils/memory/episodes/`.
- **Despacho Concorrente Disjunto:** Em tarefas transversais, cada `latex-author-agent` recebe propriedade exclusiva de arquivos `.tex` e `.svg` distintos (com prefixos de preview unicos).
- **Reciclagem de Subagentes:** Reutilizar um subagente apenas durante os ajustes de uma mesma tarefa (`N <= 3` rodadas). Ao iniciar nova secao ou auditoria global, criar instancia limpa apoiada nos episodios `EP-*.md` para evitar saturacao de cache acima de `300k` tokens.

## 3. Sistema de Memoria Cognitiva Tripartite
- **Memoria Semantica:** Invariantes fisicas e historicas e `pos_textuais/01_referencias.bib`.
- **Memoria Procedural:** Heuristicas operacionais em `utils/memory/compilation_heuristics.md` e scripts em `.agents/hooks/` e `.agents/scripts/`.
- **Memoria Episodica Relacional:** Trilhas indexadas em `utils/memory/episodes/` com frontmatter YAML, tags ontologicas e arestas de causalidade.

## 4. Governanca de Seguranca e Isolamento de Escrita
- Modificacao de `secoes/*.tex` e `img/*`: Restrita ao `latex-author-agent` com alvo exclusivo em execucoes paralelas.
- Compilacao global (`latexmk` e `audit-build.py`): Restrita ao `latex-compiler-agent`. Conversao local de SVGs via `.agents/scripts/svg2pdf.sh` permitida ao `latex-author-agent`.
- Controle de versao Git e registro de episodios: Restritos ao `orchestrator-agent` (via pathspecs explicitos, sem `git add .`).
- Agentes de leitura (`retriever-agent` e `technical-critic-agent`): Proibido editar arquivos ou executar comandos shell, sendo permitido `read_file` (incluindo PDFs/PNGs) e `search_web` para verificacao factual externa.

## 5. Fluxos de Trabalho e Validacao Preventiva
- Linting estilistico preventivo:
  ```bash
  bash .agents/hooks/latex-style-linter.sh secoes/
  ```
- Conversao e limpeza de figura SVG em coluna unica:
  ```bash
  bash .agents/scripts/svg2pdf.sh img/<figura>.svg
  bash .agents/scripts/svg2pdf.sh --clean img/<figura>.svg
  ```
- Compilacao limpa completa e auditoria estrita:
  ```bash
  latexmk -C -outdir=out main.tex && latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=out main.tex && python3 .agents/scripts/audit-build.py --strict
  ```
- Auditoria de estado e reversao de secao:
  ```bash
  git status --porcelain -- ':!out/'
  git checkout HEAD -- secoes/XX_secao_alvo.tex
  ```

## 6. Restricoes Negativas e Invariantes Comportamentais (Tolerancia Zero)
- Proibido unificar redacao, compilacao global e arbitragem em um unico agente.
- **Padrao Estrito de Duas Colunas:** Proibido usar `\begin{figure*}`. Todas as figuras devem usar `\begin{figure}[!t]` com `\includegraphics[width=\columnwidth]{...}`, legenda explicativa e chamada via `\cref{fig:...}`.
- **Protocolo Anti-Redundancia Intercapitular:** Proibido re-deduzir equacoes ou repetir metricas ja formalizadas em secoes anteriores; referenciar via `\cref{}`.
- **Consistencia de Polaridade e `siunitx`:** Manter $V_{SS} = \SI{+5}{\volt}$ acima e $V_{DD} = \SI{-10}{\volt}$ abaixo nos esquematicos PMOS; usar virgula decimal em `\SI` e nunca inserir `\text{...}` dentro do 3o argumento de `\SIrange`.
- Proibido utilizar travessoes (`—` ou `–`) ou ponto e virgula (`;`) no texto em portugues ou nas legendas/SVGs.
- Proibido usar `\textbf{}` no corpo da prosa ou em listas (restrito a cabecalhos de tabelas).
- Proibido fragmentar narrativas continuas em listas (`itemize`/`enumerate`), limitadas a no maximo um bloco breve por secao quando estritamente tecnico.
- Proibido usar jargoes de IA ou superlativos inflados (`revolucionario`, `divisor de aguas`, `genese`, `corporificou`, `impressionante`, `astronomicos`, `fundamental`, `critico`, `essencial`, `crucial`, `pioneiro`) sem suporte funcional concreto.
- Proibido transitar entre etapas sem aprovacao formal (`APPROVE`) do `technical-critic-agent`.
