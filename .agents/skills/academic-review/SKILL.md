---
name: academic-review
description: Formal evaluation rubric (v1.1.0) assessing semiconductor physics accuracy, microelectronics history fidelity, contemporary architecture comparisons, two-column visual layout, and academic prose quality.
---
# Academic Reviewer

Motor de auditoria textual, visual e conceitual (`v1.1.0`) para revisao adversarial em artigos sobre microeletronica e historia dos semicondutores.

## Quando Utilizar

Ative esta skill quando:
- Auditar a precisao fisica sobre dispositivos PMOS, NMOS, CMOS, porta autoalinhada de silicio (SGT), *bootstrapping* dinamico e escalamento de Dennard.
- Verificar a atribuicao historica da equipe MCS-4 (Faggin, Hoff, Mazor, Shima), Fairchild 3708 e arquiteturas contemporaneas (TI TMS 1000, Four-Phase AL1, Garrett CADC MP944).
- Inspecionar figuras renderizadas e paginas PNG para validar legibilidade em `\columnwidth`, alinhamento de polaridade e ausencia de `figure*`.
- Auditar anti-redundancia intercapitular, definicoes acessiveis e higiene estilistica (`0` `;`, `0` travessoes, `0` `\textbf{}` no corpo da prosa).

Nao ative quando:
- Compilar o documento (`latex-build`) ou editar diretamente arquivos `.tex`/`.svg` (`latex-writer`).

## Dimensoes da Rubrica de Avaliacao

### 1. Fidelidade Fisica e Polaridade
- PMOS com substrato tipo $n$, polissilicio $p^+$ como mascara refrataria ($\Delta L_{align}=0$), reducao de $C_{gd}$ e efeito Miller, $V_{SS}=+5\text{ V}$ e $V_{DD}=-10\text{ V}$.
- *Bootstrapping* dinamico ampliando $|V_G(t)|$ em modulo (abaixo de $-10\text{ V}$) para excursao plena $V_{out}=V_{DD}$.
- Transicao PMOS -> NMOS -> CMOS, escalamento de Dennard ($\kappa$, densidade $\kappa^2$, velocidade $\kappa$, potencia/area constante), limites em ~1 V por tunelamento quantico, barreira de potencia e DTCO.

### 2. Exatidao Historica e Confronto Contemporaneo
- Papel de Faggin na Fairchild (SGT, 3708 em 1968) e na Intel (lideranca fisica do MCS-4, contatos enterrados, *bootstrapping*, roteamento ortogonal, iniciais F.F. em 1970-1971), distinguindo a concepcao logica de Hoff e Mazor da viabilizacao fisica de Faggin e Shima.
- Precisao nos contemporaneos: TI TMS 1000 (`1971/1974`, PMOS `\SI{8}{\micro\meter}`, 1 KB ROM, 256 bits RAM), Four-Phase AL1 (`1970`, *bit-slice* de 8 bits), Garrett CADC MP944 (`1968 a 1970`, 6 tipos de chips LSI de 20 bits em 28 pastilhas, sigilo ate 1998).
- Impactos industriais e sociais: *custom* para *standard parts*, sistemas embarcados, ASEA IRB 6, Levitan e Johnson (BLS 1982) e CNC (NBER 2022).

### 3. Layout Visual em Duas Colunas (`\columnwidth`)
- Zero ocorrencias de `figure*`. Todas as figuras em `\begin{figure}[!t]` com `width=\columnwidth`, posicionadas junto aos paragrafos explicativos, com legenda clara e remissao via `\cref{fig:...}`.
- Inspecao visual via `read_file` de `img/*.pdf` e `out/pages/*.png` confirmando zero cortes, zero sobreposicoes, sinalizacao correta de espacos em `siunitx` e polaridade consistente entre esquematicos.

### 4. Higiene Estilistica, Anti-Redundancia e Clareza
- Cumprimento do Protocolo Anti-Redundancia Intercapitular (`\cref{}` em vez de re-deducoes).
- Definicoes curtas e analogias acessiveis para publico amplo sem termos promocionais ou jargoes de IA.
- Zero travessoes (`—`, `–`), zero `;`, zero `\textbf{}` fora de cabecalhos de tabela (`\toprule`), maximo 1 lista por secao.

## Criterios de Decisao

- **`APPROVE`:** `0` falhas `CRITICAL` e `0` falhas `MODERATE`.
- **`MINOR_FIX`:** `0` `CRITICAL`, mas ha falhas `MODERATE` acionaveis (ex.: `Overfull \hbox` em texto/equacao, falha de espacamento `siunitx`, legenda ou figura desalinhada).
- **`REJECT`:** Qualquer falha `CRITICAL` (erro fisico, erro historico, violacao de linter ou duplicacao de equacao).

## Restricoes Negativas
- Proibido editar arquivos diretamente ou rodar comandos shell.
- Proibido aprovar secoes com `CRITICAL` ou `MODERATE` pendentes, ou com `figure*`.
