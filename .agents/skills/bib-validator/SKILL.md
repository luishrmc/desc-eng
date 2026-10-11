---
name: bib-validator
description: Validates referential integrity between in-text LaTeX citation keys and BibTeX entries, detecting missing citations and orphaned references.
---
# Bibliography Validator

Motor especializado na verificacao de integridade referencial entre citacoes no texto LaTeX e as entradas cadastradas em arquivos BibTeX.

## Quando Utilizar
Ative esta skill quando:
- Auditar se todas as citacoes feitas no texto via `\cite{}` possuem correspondencia em `pos_textuais/01_referencias.bib`.
- Identificar entradas cadastradas no arquivo `.bib` que nao foram citadas em nenhuma secao.
- Validar a integridade sintatica de registros BibTeX antes da compilacao final.

Nao ative quando:
- Redigir o conteudo textual das secoes do artigo.
- Executar a compilacao completa do documento via `latexmk`.

## Fluxo Operacional de Validacao

### 1. Extracao de Chaves no Texto
O validador varre todos os arquivos `.tex` dentro de `secoes/` e extrai os identificadores passados aos comandos de citacao:
`\cite{chave1, chave2}` ou `\cite[opcoes]{chave}`.

### 2. Extracao de Registros no Arquivo BibTeX
O validador analisa `pos_textuais/01_referencias.bib` e mapeia todos os identificadores de entrada declarados no formato:
`@article{chave, ...}` ou `@book{chave, ...}`.

### 3. Analise de Diferencas e Integridade
O validador compara os dois conjuntos e computa:
- Chaves citadas ausentes no `.bib` (erros criticos que geram pontos de interrogacao no PDF).
- Registros no `.bib` nao citados no texto (advertencias de limpeza).
- Chaves duplicadas ou entradas com campos obrigatorios faltantes.

## Esquema de Saida Estruturada (JSON)
```json
{
  "status": "warning",
  "missing_in_bib": [
    {
      "key": "faggin1970silicon",
      "occurrences": [
        {"file": "secoes/02_fundamentacao.tex", "line": 45}
      ]
    }
  ],
  "unused_in_bib": [
    "shannon1948mathematical"
  ],
  "syntax_errors": []
}
```

## Restricoes Negativas
- Proibido excluir automaticamente entradas de `01_referencias.bib` sem solicitacao do usuario.
- Proibido usar travessoes ou ponto e virgula nos relatorios de analise.
