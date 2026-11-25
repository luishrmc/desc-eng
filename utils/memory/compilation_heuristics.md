# Memória Procedural de Compilação (`compilation_heuristics.md`)

Este arquivo registra armadilhas sintáticas, padrões de erro do compilador LaTeX (`pdflatex` / `latexmk`) e regras preventivas para acelerar as iterações e evitar retrabalho nos ciclos multiagente.

---

## 1. Tratamento de Nomes de Arquivos e Strings em Modo Texto
- **Padrão de Erro:** `! Missing $ inserted.` disparado por caracteres sublinhados (`_`) em caminhos de arquivos dentro de caixas `\parbox` ou texto padrão (ex.: `img/sgt_vs_metalgate.pdf`).
- **Regra Preventiva:** Em modo de texto padrão, qualquer caminho com sublinhado deve ser escapado como `\_` (ex.: `img/sgt\_vs\_metalgate.pdf`) ou formatado através de comandos literais como `\nolinkurl{...}` ou `\texttt{\detokenize{...}}`.

---

## 2. Unidades Físicas e Pacote `siunitx`
- **Padrão de Erro 1:** `! Package siunitx Error: Found per part with no unit.` ao tentar expressar unidades compostas não padronizadas no SI, como resistência de folha (ohms por quadrado).
- **Padrão de Erro 2 (Supressão de Espaço):** Escrever `\SIrange{30}{100}{\ohm\text{ por quadrado}}` faz o `siunitx` suprimir o espaço inicial dentro de `\text{...}`, renderizando `30 Ωpor quadrado`.
- **Regra Preventiva:** Manter `\text{...}` fora dos argumentos do `siunitx` (`entre \SI{30}{\ohm} por quadrado e \SI{100}{\ohm} por quadrado` ou `\SIrange{30}{100}{\ohm}\text{ por quadrado}`).
- **Sinais Positivos e Decimais:** `00_config.tex` deve manter `output-decimal-marker = {,}` e `retain-explicit-plus = true` em `\sisetup` para preservar sinais positivos explícitos (`+5 V`, `+0,86 V`) em sincronia com os diagramas. Usar sempre vírgula decimal dentro de `\SI{...}` e `\SIrange{...}`.

---

## 3. Dimensionamento de Tabelas, Equações e Figuras em Duas Colunas
- **Tabelas em `tabularx`:** Colunas declaradas como `c` ou `l` não realizam quebra automática de linha. Declarar colunas com quebra explícita e alinhamento à esquerda (`>{\raggedright\arraybackslash}X` ou `>{\raggedright\arraybackslash}p{...}`), evitando `Overfull \hbox` e `Underfull \hbox`.
- **Equações longas em `\columnwidth`:** Quando expressões com sinais explícitos gerarem `Overfull \hbox` em coluna única (ex.: `eq:delta_phims`), quebrar em duas linhas com `\begin{aligned} ... \end{aligned}` dentro de `equation`.
- **Figuras em Duas Colunas (Zero `figure*`):** Usar exclusivamente `\begin{figure}[!t]` com `\includegraphics[width=\columnwidth]{...}`. Figuras conceituais com dois painéis devem ser divididas em duas figuras menores complementares (`viewBox` estreito de `460` a `480` px, fonte `DejaVu Sans >= 11 px`) posicionadas junto aos parágrafos correspondentes.

---

## 4. Pipeline Determinístico de Diagramas SVG e Inspeção Visual
- **Conversão Vetorial:** Como `inkscape` e `rsvg-convert` não estão disponíveis no ambiente, utilizar o script `.agents/scripts/svg2pdf.sh img/<nome>.svg`, que encapsula `google-chrome --headless --no-sandbox --disable-gpu --print-to-pdf`, `pdfcrop` e geração de prévia PNG (`pdftoppm -png -r 150`).
- **Verificação Obrigatória:** Inspecionar visualmente o PNG gerado via `read_file` antes de liberar o diagrama e executar `.agents/scripts/svg2pdf.sh --clean img/<nome>.svg` antes do commit.

---

## 5. Dependências de Referências e Múltiplas Passagens
- **Padrão Observado:** Avisos de *undefined references* ou *undefined citations* ocorrem na primeira passagem do `pdflatex` antes da resolução do `.aux` e `.bbl`.
- **Regra Preventiva:** Validar com `python3 .agents/scripts/audit-build.py --strict` após o `latexmk` para certificar `0` avisos em `out/main.log` e `out/main.blg`, `0` referências/citações ausentes e `0` `figure*`.

---

## 6. Higiene Tipográfica Pré-Compilação
- **Regra Preventiva:** `\textbf{}` é proibido no corpo da prosa e nas listas (restrito exclusivamente a cabeçalhos de tabela). Proibidos ponto e vírgula (`;`), travessões (`—`, `–`) e jargões inflados.
- **Controle de Listas:** Teto de no máximo um ambiente `itemize` ou `enumerate` por seção, priorizando parágrafos narrativos contínuos de quatro a sete sentenças.
