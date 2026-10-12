# Diretrizes do Sistema: Artigo Academico Federico Faggin e Intel 4004

## 1. Escopo do Projeto e Arquitetura do Workspace
Este workspace hospeda o desenvolvimento de um artigo academico sobre a contribuicao tecnica de Federico Faggin no desenvolvimento da tecnologia de porta autoalinhada de silicio (Silicon Gate Technology) e na viabilizacao fisica do microprocessador comercial Intel 4004. O texto examina a transicao de circuitos integrados com porta metalica de aluminio para silicio policristalino, detalha a reducao de capacitancias parasitas e analisa os reflexos dessa mudanca estrutural na integracao de sistemas em pastilha unica.

Organizacao de pastas do repositorio:
- `00_config.tex`: Declaracao de pacotes, definicao de estilos e parametros tipograficos globais.
- `main.tex`: Arquivo de entrada principal que organiza a inclusao das secoes textuais.
- `secoes/`: Arquivos `.tex` correspondentes a cada subdivisao do artigo.
- `pos_textuais/01_referencias.bib`: Catalogo de fontes bibliograficas e citacoes.
- `img/`: Vetores, esquematicos e figuras dos dispositivos semicondutores.
- `utils/docs/aulas/`: Material instrucional da disciplina, com enfase na Aula 4 sobre valvulas, transistores e circuitos integrados.
- `utils/docs/ref/`: Artigo modelo de referencia e diretrizes de formatacao.
- `utils/docs/search/`: Fontes documentais primarias, patentes e artigos historicos coletados.
- `out/`: Diretorio de saida isolado para artefatos gerados pelo compilador LaTeX.

## 2. Topologia Multi-Agente e Orquestracao em Malha Fechada
O desenvolvimento opera sob uma arquitetura de cinco agentes especializados:
1. `orchestrator-agent` (Modelo: pro): Coordenacao central, manutencao da maquina de estados e controle do teto de cinco iteracoes por secao.
2. `retriever-agent` (Modelo: flash): Extracao de dados conceituais e historicos a partir dos arquivos em `utils/`.
3. `latex-author-agent` (Modelo: pro): Redacao e edicao incremental de codigo LaTeX nas secoes do artigo.
4. `latex-compiler-agent` (Modelo: flash): Compilacao nao-interativa e diagnostico de erros de tipografia em `out/`.
5. `technical-critic-agent` (Modelo: pro): Auditoria de conceitos de fisica de semicondutores e fidelidade historica.

A execucao de cada secao segue a sequencia fechada:
1. O supervisor requisita evidencias documentais ao agente de recuperacao.
2. O redator elabora o texto em LaTeX a partir das evidencias recebidas.
3. O compilador processa o documento e emite relatorio de diagnostico.
4. O revisor audita o rigor fisico e emite parecer com aprovacao ou solicitacao de correcoes.
5. Se ocorrer falha ou rejeicao, o redator executa nova tentativa dentro do limite maximo de cinco iteracoes.
6. Atingido o limite de cinco iteracoes sem convergencia, o supervisor dispara reversao automatica no git.

## 3. Matriz de Skills e Capacidades
- `latex-writer`: Edicao especializada de codigo fonte `.tex` e estruturacao de blocos academicos.
- `latex-build`: Compilacao em modo em lote com saidas direcionadas para `out/`.
- `search-retriever`: Leitura e mineracao de documentos em `utils/docs/`.
- `bib-validator`: Checagem automatizada de paridade entre chaves `\cite{}` e registros `.bib`.
- `academic-review`: Rubrica formal de avaliacao de precisao fisica e estilo textual.

## 4. Governanca de Seguranca e Politica de Permissoes
- Modificacao de arquivos `.tex` em `secoes/`: Permitida exclusivamente ao `latex-author-agent`.
- Comandos de compilacao no terminal: Permitidos exclusivamente ao `latex-compiler-agent`.
- Comandos de reversao de codigo: Restritos ao `orchestrator-agent`.
- Agentes de consulta (`retriever-agent` e `technical-critic-agent`) operam em modo estritamente de leitura.

## 5. Fluxos de Trabalho e Comandos de Execucao
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

## 6. Restricoes Negativas e Invariantes Comportamentais
- Proibido gerar agentes genericos que unifiquem escrita, compilacao e arbitragem.
- Proibido utilizar travessoes em-dash, en-dash ou ponto e virgula na producao de textos.
- Proibido o uso de \textbf{} no corpo da prosa ou em listas. O negrito fica restrito exclusivamente a elementos estruturais padronizados do documento (ex.: cabecalhos de tabela e comandos de secao).
- Proibido o uso de listas (itemize ou enumerate) para narrativas ou explicacoes continuas. O texto deve ser redigido prioritariamente em prosa corrida e paragrafos coesos. O uso de listas fica limitado a no maximo um bloco breve por secao, estritamente quando indispensavel para especificacoes tecnicas formais.
- Proibido o uso de jargoes empolados de IA e academicismos vazios (ex.: "alta heterogeneidade topologica", "filtros criticos rigorosos", "confluencia interdisciplinar", "vertices epistemicos"). Adotar linguagem tecnica natural, direta e humana de engenharia.
- Proibido o uso inflado e desnecessario de termos como "fundamental", "critico" ou "essencial". Esses vocabulos so devem ser empregados quando houver suporte fisico e quantitativo estrito para a afirmacao.
- Proibido transitar entre secoes do artigo sem parecer formal de aprovacao emitido pelo revisor.
