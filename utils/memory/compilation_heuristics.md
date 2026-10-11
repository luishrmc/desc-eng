# Memória Procedural de Compilação (`compilation_heuristics.md`)

Este arquivo registra armadilhas sintáticas, padrões de erro do compilador LaTeX (`pdflatex` / `latexmk`) e regras preventivas para acelerar as iterações e evitar retrabalho nos ciclos multiagente.

---

## 1. Tratamento de Nomes de Arquivos e Strings em Modo Texto
- **Padrão de Erro:** `! Missing $ inserted.` disparado por caracteres sublinhados (`_`) em caminhos de arquivos dentro de caixas `\parbox` ou texto padrão (ex.: `img/sgt_vs_metalgate.pdf`).
- **Regra Preventiva:** Em modo de texto padrão, qualquer caminho com sublinhado deve ser escapado como `\_` (ex.: `img/sgt\_vs\_metalgate.pdf`) ou formatado através de comandos literais como `\nolinkurl{...}` ou `\texttt{\detokenize{...}}`.

---

## 2. Unidades Físicas e Pacote `siunitx`
- **Padrão de Erro:** `! Package siunitx Error: Found per part with no unit.` ao tentar expressar unidades compostas de engenharia não padronizadas no SI, como resistência de folha (ohms por quadrado).
- **Regra Preventiva:** O comando `\square` no `siunitx` é exclusivamente um modificador de potência de área (ex.: `\square\metre`). Para grandezas como $\Omega/\square$, deve-se utilizar `\SIrange{30}{100}{\ohm\text{ por quadrado}}` ou expressar explicitamente via modo matemático `$\SI{30}{\ohm/\Box}$`.

---

## 3. Dimensionamento de Tabelas em `tabularx`
- **Padrão de Erro:** `Overfull \hbox` em tabelas ajustadas à largura de coluna (`\columnwidth`).
- **Regra Preventiva:** Colunas declaradas como `c` ou `l` não realizam quebra automática de linha. Quando o cabeçalho ou o conteúdo contiver textos explicativos médios, deve-se declarar colunas com quebra explícita, como `>{\centering\arraybackslash}p{2.3cm}` ou `>{\raggedright\arraybackslash}X`, garantindo encaixe estrito na largura da coluna sem transbordamento.

---

## 4. Dependências de Referências e Múltiplas Passagens
- **Padrão Observado:** Avisos de *undefined references* ou *undefined citations* ocorrem naturalmente na primeira passagem do `pdflatex` antes da resolução do arquivo `.aux` e `.bbl`.
- **Regra Preventiva:** Se o código de saída for `0` e o `latexmk` concluir as passagens de convergência com `out/main.blg` limpo, avisos transitórios da primeira passagem são automaticamente resolvidos.

---

## 5. Higiene Tipográfica Pré-Compilação
- **Padrão de Erro / Desvio:** Ocorrência de `\textbf{}` no corpo do texto ou no início de itens em listas, fragmentando a mancha tipográfica do formato IEEE.
- **Regra Preventiva:** `\textbf{}` é estritamente proibido no corpo da prosa e nas listas. Reservar o comando unicamente para cabeçalhos de tabela (`\toprule`).
- **Controle de Listas:** Teto de no máximo um ambiente `itemize` ou `enumerate` por seção. O texto deve ser estruturado prioritariamente em parágrafos narrativos contínuos de quatro a sete sentenças.
