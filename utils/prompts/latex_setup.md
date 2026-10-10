# PAPEL E PERFIL
Você atua como um Arquiteto de Sistemas LaTeX Acadêmicos e Engenheiro de Compilação. Sua especialidade é conceber repositórios documentais modulares, livres de erros de compilação, estruturados rigorosamente segundo o padrão IEEE Transactions/Artigo Científico em duas colunas, conforme demonstrado no artigo de referência da disciplina.

---

# OBJETIVO
Analisar as diretrizes em `utils/Trabalhos/Orientacoes_Trabalho.pdf` e o artigo de referência `utils/Trabalhos/Michael_Faraday.pdf` para projetar a estrutura completa de um novo repositório modular LaTeX. O workspace deve ser preparado para receber a redação do artigo intitulado:

> **"A Invenção do Circuito Integrado Monolítico e seus Impactos Tecnológicos e Sociais: Uma Análise Histórico-Pedagógica"**
> *(Pioneirismo de Jack Kilby e Robert Noyce, a Tirania dos Números, o Processo Planar de Silício e a Transformação Curricular no Ensino da Engenharia)*

---

# DOCUMENTOS DE REFERÊNCIA E ESPECIFICAÇÕES

1. **Guia de Estrutura (`Orientacoes_Trabalho.pdf`):**
   - Estrutura sequencial mandatória: Título, Autoria/Afiliações, Resumo (até 250 palavras), Palavras-chave (4 a 6 termos), Introdução, Fundamentação Teórica, Metodologia, Resultados, Discussão, Conclusão, Agradecimentos e Referências no padrão IEEE (numéricas consecutivas [1], [2]).
2. **Modelo Tipográfico (`Michael_Faraday.pdf`):**
   - Classe de documento: Formato de artigo IEEE (duas colunas, títulos de seção em algarismos romanos centralizados ou alinhados à esquerda: `I. INTRODUÇÃO`, `II. FUNDAMENTAÇÃO TEÓRICA`, etc.).
   - Tabelas comparativas e equações destacadas integradas sintaticamente à narrativa.
3. **Escopo Temático Obrigatório:**
   - *Eixo Técnico/Histórico:* O dilema da "tirania dos números" na década de 1950, o circuito híbrido em germânio de Jack Kilby (Texas Instruments, 1958), a patente do circuito planar integrado de silício com óxido protetor e interconexões de alumínio de Robert Noyce e Jean Hoerni (Fairchild Semiconductor, 1959).
   - *Eixo Social e Pedagógico:* Conquistas tecnológicas (Programa Apollo, Minuteman, miniaturização de semicondutores e computação pessoal) e impacto curricular na Engenharia Elétrica (transição do ensino baseado em circuitos discretos para a abstração de blocos integrados, VLSI e EDA).

---

# ARQUITETURA DO NOVO WORKSPACE

O setup gerado deve seguir a seguinte topologia de arquivos na raiz do projeto:

```text
artigo-circuito-integrado/
├── 00_config.tex               # Preâmbulo, pacotes IEEE, fontes, comandos auxiliares e o título do artigo
├── main.tex                    # Ponto de entrada estrutural modular (metadados e inputs)
├── secoes/
│   ├── 00_resumo.tex           # Abstract e Palavras-chave
│   ├── 01_introducao.tex       # Contextualização do problema e estrutura
│   ├── 02_fundamentacao.tex    # A tirania dos números e evolução conceitual
│   ├── 03_metodologia.tex      # Análise documental e triangulação histórica
│   ├── 04_resultados.tex       # Kilby vs. Noyce, patentes, equações e tabelas de impacto
│   ├── 05_discussao.tex        # Interfaces sociais, simbiose industrial e modelo pedagógico
│   └── 06_conclusao.tex        # Síntese das contribuições e considerações finais
├── img/                        # Diagramas conceituais, patentes e gráficos históricos
└── pos_textuais/
    └── 01_referencias.bib      # Base bibliográfica no formato BibTeX (IEEE)

```

---

# TAREFAS DE EXECUÇÃO (PIPELINE OBRIGATÓRIO)

### Etapa 0: Analisar o modelo de referência utilizado para produzir o relatório de um laboratório de conversão de energia 

Vá a pasta `/home/luis/ufmg/lab-conv/lab8-9-10` e avalie o setup: 

```text 
├── 00_config.tex
├── GEMINI.md
├── img
│   ├── ee.png
│   ├── lab10
│   ├── lab8
│   └── lab9
├── lab10
│   ├── 01_introducao.tex
│   ├── 02_pre_relatorio.tex
│   ├── 03_experimento1.tex
│   └── 04_experimento2.tex
├── lab8
│   ├── 01_introducao.tex
│   ├── 02_pre_relatorio.tex
│   ├── 03_experimento1.tex
│   └── 04_experimento2.tex
├── lab9
│   ├── 01_introducao.tex
│   ├── 02_experimento1.tex
│   ├── 03_experimento2.tex
│   └── 04_experimento3.tex
├── main.tex
├── pos_textuais
│   ├── 01_conclusao.tex
│   └── 02_referencias.bib
├── pre_textuais
│   └── 00_capa.tex
└── utils
```

### Etapa 1: Definição do Preâmbulo (`00_config.tex`)

* Configurar os pacotes essenciais para compatibilidade com o formato IEEE de duas colunas (`amsmath`, `amssymb`, `graphicx`, `booktabs`, `cite`, `url`, `hyperref`, `babel` com suporte a português).
* Assegurar compatibilidade com compilação direta via `pdflatex` ou `latexmk`.

### Etapa 2: Implementação do Arquivo Mestre (`main.tex`)

* Integrar a classe adequada (ex.: `\documentclass[journal, twocolumn]{IEEEtran}` ou equivalente de duas colunas compatível com o artigo de referência).
* Definir cabeçalhos, notas de rodapé institucionais (UFMG / DEE) e a invocação sequencial via `\input{secoes/...}`.
* Configurar o fechamento com `\bibliographystyle{IEEEtran}` apontando para `pos_textuais/02_referencias.bib`.

### Etapa 3: Scaffolding Modular com Comentários Exaustivos (`secoes/*.tex`)

* Para cada um dos arquivos em `secoes/`, fornecer o código LaTeX mínimo compilável contendo os comandos de divisão formal (`\section`, `\subsection`) e blocos de comentários (`% [DIRETIVA DE ESCRITA]`) detalhando:
* O conteúdo técnico-histórico e pedagógico exato a ser redigido naquele arquivo.
* Tabelas comparativas planejadas (ex.: Germânio/Mesa de Kilby vs. Silício/Planar de Noyce-Hoerni).
* Equações e métricas históricas de escala (ex.: densidade de empacotamento, Lei de Moore preliminar, confiabilidade das interconexões).
* Questões de reflexão curricular e pedagógica demandadas pelo trabalho.



---

# RESTRIÇÕES MANDATÓRIAS

1. **Foco Estrito no Setup e Scaffolding:** NÃO redija os textos dissertativos completos dos capítulos. Forneça a estrutura sintática, seções, subseções e comentários-guia detalhados.
2. **Compatibilidade Estrutural:** Não utilize comandos de relatório como `\chapter`, pois o documento mestre é um artigo acadêmico (`article` ou `IEEEtran`).
3. **Comentários em Português Técnico:** Todas as diretrizes e comentários devem estar em Português (Brasil), aderentes à terminologia clássica de microeletrônica e semicondutores.

---

# FORMATO DE SAÍDA EXIGIDO

Responda estruturado com blocos de código completos:

## 1. Mapeamento da Arquitetura do Artigo

* Breve justificativa da modularização das seções baseada no modelo `Michael_Faraday.pdf` e nas `Orientacoes_Trabalho.pdf`.

## 2. Preâmbulo Global (`00_config.tex`)

```latex
% Código de 00_config.tex

```

## 3. Arquivo Mestre (`main.tex`)

```latex
% Código de main.tex

```

## 4. Arquivos Modulares de Conteúdo (`secoes/*.tex` e `pos_textuais/*.tex`)

* Apresentar o template de cada arquivo com seções, subseções, placeholders e diretrizes em comentários `%`.

```