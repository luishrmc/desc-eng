---
name: bib-validator
description: Validates referential integrity (v1.1.0) across in-text LaTeX citations vs BibTeX entries, cross-reference labels (\label vs \cref/\ref), and figure file paths (\includegraphics vs img/).
---
# Bibliography and Reference Validator

Motor especializado (`v1.1.0`) na verificacao de integridade referencial completa do manuscrito LaTeX: chaves `\cite{}` vs `pos_textuais/01_referencias.bib`, rotulos `\label{}` vs `\cref{}`/`\ref{}` e caminhos `\includegraphics{}` vs `img/`.

## Quando Utilizar

Ative esta skill quando:
- Auditar se todas as citacoes `\cite{}` em `secoes/*.tex` constam em `pos_textuais/01_referencias.bib` sem entradas duplicadas ou orfas.
- Mapear e validar todas as remissoes cruzadas `\cref{...}` antes e depois de dividir ou renomear figuras, secoes ou equacoes.
- Conferir se todas as figuras em `\includegraphics` existem em `img/` e se nao restam ambientes `figure*`.

Nao ative quando:
- Redigir prosa academica ou executar compilacao `latexmk` diretamente.

## Fluxo Operacional de Validacao

1. **Extracao de Citacoes e BibTeX:** Comparar todas as chaves `\cite{}` (desmembrando citacoes multiplas por virgula) contra as chaves declaradas em `pos_textuais/01_referencias.bib`, acusando chaves ausentes (`missing_in_bib`), duplicadas (`bib_duplicates`) e orfas (`unused_in_bib`).
2. **Extracao de Rotulos Cruzados:** Mapear todos os `\label{...}` e conferir todas as chamadas `\cref{}`, `\Cref{}`, `\ref{}` e `\eqref{}` (desmembrando listas separadas por virgula) para garantir `missing_labels == []`.
3. **Verificacao de Figuras:** Confirmar que todo alvo de `\includegraphics` existe em `img/` e que `figure_star_count == 0`.
4. **Execucao Automatizada:** Utilizar `python3 .agents/scripts/audit-build.py --json` quando houver acesso a shell (via `latex-compiler-agent`) ou inspecao direta dos arquivos em modo de leitura.

## Restricoes Negativas

- Proibido excluir automaticamente entradas de `pos_textuais/01_referencias.bib` sem solicitacao ou autorizacao do usuario.
- Proibido usar travessoes (`—`, `–`) ou ponto e virgula (`;`) nos relatorios de analise.
