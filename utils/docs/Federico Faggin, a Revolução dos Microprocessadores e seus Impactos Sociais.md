# Federico Faggin, a Revolução dos Microprocessadores e seus Impactos Sociais

## Escopo, método e correções documentais

Este levantamento triangula fontes primárias — patente, manual da família MCS-4, ficha técnica, história oral com os participantes e artigos dos próprios autores — com fontes institucionais do IEEE, Intel e Computer History Museum (CHM). A tese central sustentada pela documentação é que a invenção do 4004 não deve ser reduzida a um único ato: Hoff e Mazor formularam a arquitetura simplificada; Shima transformou requisitos da Busicom em especificação lógica, instruções e programas de aplicação; Faggin converteu essa especificação em circuitos, metodologia, máscaras e silício funcional, liderando a execução dos quatro chips.[^1][^2][^3]

Duas correções são indispensáveis. Primeiro, a patente US 3,475,234 não é da Fairchild nem de 1968: foi depositada em 27 de março de 1967, concedida em 28 de outubro de 1969 e atribuída à Bell Telephone Laboratories, com Robert E. Kerwin, Donald L. Klein e John C. Sarace como inventores. Segundo, “doze chips” é a descrição retrospectiva da proposta inicial usada por Intel e IEEE, enquanto Shima, em história oral, recorda nove tipos de LSI, depois reduzidos a oito; a divergência provavelmente decorre de contar “tipos” versus quantidade física no sistema, e deve ser explicitada em vez de apagada.[^4][^5][^6]

***

## Eixo 1 — Contexto histórico e problema técnico

### 1. Síntese técnica objetiva

#### Da “tirania dos números” ao SSI/MSI

A expressão “tirania dos números” aparece no artigo de J. A. Morton e W. J. Pietenpol, “The Technological Impact of Transistors”, publicado em junho de 1958 no *Proceedings of the IRE*, vol. 46, n. 6, p. 955 em diante. O problema não era apenas o número de dispositivos, mas o crescimento combinado de fabricação, teste, encapsulamento e interconexões: Morton observou que cada elemento precisava ser produzido, testado e interligado individualmente, criando uma barreira de confiabilidade e custo para sistemas digitais grandes.[^7][^8][^9]

Os circuitos SSI/MSI mitigaram a montagem de componentes discretos, mas não eliminaram a barreira no nível do sistema. Funções complexas continuavam distribuídas por dezenas de encapsulamentos, e o número de terminais, trilhas de placa, soldas e interfaces crescia aproximadamente com a partição lógica. Se cada conexão tivesse confiabilidade independente aproximada de 

\[
R_c = 1-p,
\]

então um sistema com \(N\) conexões teria, em primeira aproximação,

\[
R_{sys}\approx(1-p)^N\approx e^{-Np}.
\]

A dedução explica por que reduzir *package count* e interconexões externas era uma mudança de sistema, não apenas uma miniaturização geométrica. O próprio manual MCS-4 apresentou o conjunto como alternativa a sistemas SSI/MSI de lógica aleatória e destacou menor inventário, inserção automática, menor trabalho de montagem e alterações funcionais por ROM em lugar de refazer placas.[^1]

#### Gênese Busicom–Intel

A Busicom procurou a Intel em 1969 para uma família de LSI destinada a calculadoras e outras máquinas comerciais. Na história oral do CHM, Shima afirma que sua proposta começou com nove tipos de LSI e passou a oito: dois para computador decimal, ROM de programa, registrador de deslocamento, controladores de teclado/display e impressora, além de *print buffer*; a Intel considerou o conjunto complexo demais e com transistores e terminais demais. Já a narrativa Intel/IEEE consolidou a contagem de doze chips personalizados, contraposta à solução de quatro chips.[^5][^6][^1]

Hoff propôs substituir funções de lógica fixa por uma CPU binária de 4 bits, RAM, ROM e I/O programado. Mazor, incorporado ao grupo em setembro de 1969, atuou na consolidação da especificação, no estudo das instruções e na interface com os requisitos da Busicom. A gerência da Busicom aceitou a direção da Intel em outubro de 1969, mas a especificação detalhada continuou sendo refinada com Shima, que testou a arquitetura por programação de calculadoras, solicitou mudanças no conjunto de instruções e contribuiu para a lógica de controle de periféricos.[^2][^1]

#### A lacuna de implementação

A arquitetura de Hoff/Mazor era um conceito funcional, não um projeto pronto para fabricação. Ambos reconheceram que não eram projetistas MOS de chip e transferiram o trabalho ao grupo de Les Vadasz; a etapa de circuitos e leiaute permaneceu sem responsável até abril de 1970. Quando Faggin entrou na Intel em 3 de abril de 1970, encontrou especificações, diagramas de blocos e circuitos fragmentários, mas nenhum esquema lógico completo da CPU, nenhuma metodologia consolidada para lógica aleatória em SGT e um cronograma contratual já atrasado.[^1]

A inexequibilidade prática tinha quatro dimensões:

- **Densidade de interconexão:** uma CPU é lógica aleatória, não uma matriz regular de memória; a metalização única e os contatos convencionais impunham cruzamentos, área e congestionamento.
- **Velocidade/potência:** cargas MOS convencionais introduziam queda de limiar e corrente insuficiente; o produto \(R_{on}C_L\) seria alto demais para a meta de temporização.
- **Metodologia:** faltavam bibliotecas de blocos, regras de dimensionamento, fluxo de verificação e disciplina de leiaute para aproximadamente 2.300 transistores.
- **Encapsulamento:** apenas 16 pinos exigiam barramento multiplexado e decodificação distribuída entre CPU, ROM e RAM, elevando a complexidade temporal interna.[^10][^1]

Faggin desenvolveu a metodologia de projeto, os blocos de circuito, o dimensionamento, o leiaute e a verificação; aplicou contato enterrado e carga *bootstrap* à SGT e conduziu a execução dos chips 4001, 4002, 4003 e 4004. Shima retornou para lógica, simulação, programas e inspeção de leiaute. O primeiro lote do 4004 falhou porque a máscara de contato enterrado fora omitida; o lote corrigido demonstrou silício funcional no início de 1971, evidenciando que o contato era estrutural, não cosmético.[^11][^10]

### 2. Fontes primárias

| Documento | Autoria/data | Evidência principal |
|---|---|---|
| “The Technological Impact of Transistors” | J. A. Morton; W. J. Pietenpol, 1958 | Formula a “tirania dos números” como barreira de dispositivos e interconexões.[^9] |
| *Oral History Panel on the Development and Promotion of the Intel 4004 Microprocessor* | Faggin, Feeney, Hoff, Mazor e Shima; entrevista de 2007 | Depoimentos cruzados sobre a proposta Busicom, arquitetura Intel, atraso, entrada de Faggin e papéis individuais.[^1] |
| “The History of the 4004” | Faggin, Hoff, Mazor e Shima, 1996 | Revisão histórica dos autores, DOI 10.1109/40.546561.[^12] |
| *MCS-4 Micro Computer Set Users Manual* | Intel, rev. 4, 1973 | Declara a substituição de lógica aleatória SSI/MSI por sistema programável em ROM e documenta arquitetura e temporização.[^1] |

**Trechos-chave curtos:** Morton descreve sistemas que exigiam “hundreds, thousands, and sometimes tens of thousands” de dispositivos; Hoff afirmou que a etapa faltante era “detailed circuit and layout”; Shima reagiu ao material inicial como “just idea”.[^7][^1]

### 3. Quadro de dados técnicos

| Grandeza | Valor/expressão | Interpretação |
|---|---:|---|
| Confiabilidade aproximada | \(R_{sys}\approx(1-p)^N\) | Aumentar interconexões reduz exponencialmente a confiabilidade, sob hipótese de falhas independentes. |
| Proposta Busicom | 9 tipos, depois 8, segundo Shima | Contagem por tipos de LSI na história oral.[^1] |
| Proposta retrospectiva | 12 chips personalizados | Contagem consolidada em narrativas Intel/IEEE.[^5][^6] |
| Solução Intel | 4 chips | 4001, 4002, 4003 e 4004.[^1] |
| Entrada de Faggin | 3 abr. 1970 | Início da execução física e circuital.[^1] |
| Meta de transistores | cerca de 2.000 | Meta relatada por Shima; o 4004 final teve cerca de 2.300.[^1][^13] |
| Pinos | 16 | Restrição que motivou barramento de 4 bits multiplexado e controle compartilhado.[^1] |

### 4. Registro BibTeX

```bibtex
@article{MortonPietenpol1958,
  author  = {Morton, J. A. and Pietenpol, W. J.},
  title   = {The Technological Impact of Transistors},
  journal = {Proceedings of the IRE},
  year    = {1958},
  volume  = {46},
  number  = {6},
  pages   = {955--959},
  month   = jun
}

@article{FagginEtAl1996History4004,
  author  = {Faggin, Federico and Hoff, Marcian E., Jr. and Mazor, Stanley and Shima, Masatoshi},
  title   = {The History of the 4004},
  journal = {IEEE Micro},
  year    = {1996},
  volume  = {16},
  number  = {6},
  pages   = {10--20},
  doi     = {10.1109/40.546561}
}

@misc{CHM4004OralHistory2007,
  author       = {Faggin, Federico and Feeney, Hal and Hoff, Ted and Mazor, Stanley and Shima, Masatoshi},
  title        = {Oral History Panel on the Development and Promotion of the Intel 4004 Microprocessor},
  howpublished = {Computer History Museum, CHM Ref. X4024.2007},
  year         = {2007},
  month        = apr,
  url          = {https://archive.computerhistory.org/resources/access/text/2012/04/102658187-05-01-acc.pdf},
  note         = {Interviewed by Dave House; edited by David Laws}
}

@manual{IntelMCS4Manual1973,
  organization = {Intel Corporation},
  title        = {MCS-4 Micro Computer Set Users Manual},
  edition      = {Revision 4},
  year         = {1973},
  month        = feb,
  url          = {https://archive.org/details/bitsavers_intelMCS4M_18342130}
}
```

***

## Eixo 2 — Física de semicondutores e engenharia de dispositivos

### 1. Síntese técnica objetiva

#### Porta de alumínio versus SGT

No processo MOS de porta metálica, fonte e dreno eram difundidos antes da definição da porta de alumínio. O alinhamento entre máscaras independentes exigia margem lateral \(L_{ov}\) para assegurar que a porta cobrisse o canal apesar do erro litográfico. Essa margem aumentava a área e criava capacitâncias porta-fonte e porta-dreno de sobreposição.

Na porta autoalinhada, o silício policristalino é depositado sobre o óxido fino, definido litograficamente e usado como máscara durante a difusão/implantação de fonte e dreno. A borda da porta passa a definir fisicamente a borda das regiões difundidas. A reivindicação 1 da US 3,475,234 descreve exatamente a sequência: camada isolante, camada de silício seletiva, remoção do isolante exposto e difusão de impurezas usando o silício como máscara, simultaneamente tornando-o condutor.[^4]

A eliminação é do **termo geométrico de tolerância de máscara**, não de toda capacitância de franja. Idealmente, \(L_{ov}\to0\) para a sobreposição deliberada; na fabricação real permanecem difusão lateral e campos de franja. Assim,

\[
C_{ov}=C_{ox}WL_{ov}, \qquad C_{ox}=\frac{\varepsilon_{ox}}{t_{ox}},
\]

por lado de sobreposição. Como \(C_{gd}\) realimenta a transição de saída à entrada, seu valor efetivo pode ser ampliado pelo efeito Miller:

\[
C_{in,eff}\approx C_{gs}+C_{gd}(1-A_v).
\]

Em um inversor, \(A_v<0\), de modo que \(C_{gd}\) pesa mais que sua capacitância física. O autoalinhamento reduz a carga dinâmica, o atraso e a dispersão de atraso associada à tolerância de alinhamento.

#### Limiar e função-trabalho

Em forma simplificada, a tensão de limiar PMOS depende de

\[
V_{th}=V_{FB}+2\phi_F+\frac{Q_B}{C_{ox}},
\qquad
V_{FB}=\Phi_{ms}-\frac{Q_{ox}}{C_{ox}}.
\]

Ao substituir alumínio por polisilício fortemente dopado do tipo p sobre substrato n, a diferença de função-trabalho porta–semicondutor \(\Phi_{ms}\) diminuiu aproximadamente 1,1 V para os dispositivos PMOS de então. Essa alteração reduziu o módulo de \(V_{th}\) em aproximadamente 30%, permitindo alimentação de cerca de −15 V em vez de −24 V e melhorando potência, velocidade e confiabilidade.[^14][^15]

“Estabilização” requer precisão conceitual: a escolha do polisilício dopado tornou \(\Phi_{ms}\) controlável pelo processo e compatível com o tratamento térmico; o autoalinhamento estabilizou capacitâncias geométricas. Isso não eliminou variações de \(V_{th}\) por carga no óxido, contaminação, espessura de óxido e dopagem. A patente US 3,673,471 de Klein e Faggin tratou especificamente do controle da tensão de limiar por eletrodo semicondutor apropriadamente dopado.[^16]

#### Polissilício como interconexão

A SGT introduziu uma camada condutora adicional antes do metal. Portas de polisilício podiam prolongar-se como interconexões; difusões no substrato forneciam outra direção de roteamento, e o alumínio permanecia como camada superior. A reivindicação 7 da US 3,475,234 explicita o uso seletivo da camada de silício para conectar porta, dreno e fonte de múltiplos dispositivos.[^4]

O *buried contact* conectava diretamente polisilício e difusão, evitando uma ilha de metal e seus *clearances*. Isso não equivale a duas camadas metálicas modernas; equivale a explorar polisilício e difusão como níveis roteáveis complementares ao alumínio. Faggin declarou que essa técnica lhe forneceu “effectively two layers of interconnections” e que, sem ela, o 4004 não caberia.[^10][^11]

#### Família MCS-4

O manual define quatro blocos padronizados, todos em DIP de 16 pinos: CPU 4004, ROM 4001, RAM 4002 e registrador 4003. CPU, ROM e RAM compartilhavam barramento bidirecional de quatro linhas, duas fases de relógio não sobrepostas, SYNC e linhas de comando; o 4003 era estático e usava relógio próprio.[^1]

| CI | Função e organização | Interação no sistema |
|---|---|---|
| 4001 | ROM mascarada de 2.048 bits, organizada como 256 × 8, mais porta de I/O de 4 bits | Recebe endereço multiplexado, devolve instrução em dois *nibbles* e pode ler/escrever porta conforme opção de máscara.[^1] |
| 4002 | RAM de 320 bits: quatro registradores, cada qual com 16 caracteres principais de 4 bits e quatro caracteres de estado de 4 bits; porta de saída de 4 bits | Endereçada por banco/chip/registrador/caractere; executa instruções de RAM/I/O observadas no barramento.[^1] |
| 4003 | Registrador estático de 10 bits, entrada serial, saídas paralelas e saída serial | Expande saídas; pode ser encadeado; não usa \(\phi_1/\phi_2\) do sistema.[^1] |
| 4004 | CPU paralela de 4 bits; acumulador, *carry*, 16 registradores de 4 bits, contador de programa e pilha de três retornos | Gera SYNC e comandos, endereça ROM/RAM, busca e executa instruções pelo barramento de 4 bits.[^1] |

O 4004 foi fabricado em PMOS de porta de silício, largura mínima de 10 µm, *die* de 12 mm², wafer de 2 polegadas e aproximadamente 2.300 transistores. O manual e a ficha técnica especificam \(V_{SS}\) como potencial mais positivo/terra e \(V_{DD}=V_{SS}-15\text{ V}\), com tolerância de 5%; portanto, “−15 V” deve ser entendido no sistema de referência de lógica negativa original, não como alimentação CMOS moderna.[^13][^17][^1]

### 2. Fontes primárias

| Documento | Autoria/data | Trecho/reivindicação-chave |
|---|---|---|
| “Silicon Gate Technology” | Federico Faggin; Thomas Klein, 1970 | Artigo seminal em *Solid-State Electronics*, vol. 13, n. 8, pp. 1125–1144, DOI 10.1016/0038-1101(70)90124-3.[^18][^19] |
| US 3,475,234, “Method for Making MIS Structures” | R. E. Kerwin; D. L. Klein; J. C. Sarace; Bell Labs; depósito 1967, concessão 1969 | Reivindicação 1 cobre o uso da camada de silício como máscara de difusão autoalinhada; reivindicação 7 cobre conexões entre dispositivos.[^4] |
| US 3,673,471, “Doped Semiconductor Electrodes for MOS Type Devices” | Thomas Klein; Federico Faggin; depósito 1970, concessão 1972 | Controla/desloca \(V_{th}\) por material semicondutor de porta apropriadamente dopado.[^16] |
| *MCS-4 Micro Computer Set Users Manual* | Intel, 1973 | Capacidades, barramento, temporização, alimentação e encapsulamento dos quatro CIs.[^1] |

### 3. Quadro de dados técnicos

| Parâmetro | Metal-gate PMOS | Silicon-gate PMOS | Consequência física |
|---|---:|---:|---|
| Definição de porta/fonte-dreno | Máscaras separadas | Porta de poli é máscara de difusão | Remove margem sistemática de alinhamento.[^4] |
| Sobreposição deliberada | \(L_{ov}>0\) | \(L_{ov}\to0\), idealmente | Reduz \(C_{gs,ov}\) e \(C_{gd,ov}\). |
| Capacitância | \(C_{ov}=C_{ox}WL_{ov}\) | Menor \(L_{ov}\) | Menor carga e efeito Miller. |
| Diferença de \(V_{th}\) | Referência Al-gate | Redução de aproximadamente 1,1 V | Aproximadamente 30% menor módulo de limiar.[^14] |
| Alimentação típica histórica | cerca de −24 V | cerca de −15 V | Menor potência e maior margem prática.[^15] |
| Velocidade de lógica aleatória | 1× | 3–5× na mesma dissipação | Resultado agregado de limiar, capacitância e circuito.[^20] |
| Densidade de lógica aleatória | 1× | cerca de 2× | Autoalinhamento, poli roteável e contatos enterrados.[^20] |

| Parâmetro MCS-4 | Valor |
|---|---:|
| Processo | PMOS, porta de silício autoalinhada |
| Dimensão mínima | 10 µm[^13] |
| 4004, transistores | aproximadamente 2.300[^13] |
| Área do *die* 4004 | 12 mm²[^17] |
| Densidade bruta inferida | aproximadamente 192 transistores/mm² |
| Alimentação | \(V_{DD}=-15\text{ V}\) em relação a \(V_{SS}\), ±5%[^1] |
| Encapsulamento | DIP, 16 pinos, para os quatro CIs[^1] |
| Barramento | 4 bits, bidirecional[^1] |
| ROM máxima direta | 16 × 4001 = 4.096 × 8 bits[^1] |
| RAM máxima direta | 16 × 4002 = 5.120 bits[^1] |

### 4. Registro BibTeX

```bibtex
@article{FagginKlein1970SGT,
  author  = {Faggin, Federico and Klein, Thomas},
  title   = {Silicon Gate Technology},
  journal = {Solid-State Electronics},
  year    = {1970},
  volume  = {13},
  number  = {8},
  pages   = {1125--1144},
  doi     = {10.1016/0038-1101(70)90124-3}
}

@patent{KerwinKleinSarace1969,
  author      = {Kerwin, Robert E. and Klein, Donald L. and Sarace, John C.},
  title       = {Method for Making MIS Structures},
  number      = {US3475234A},
  assignee    = {Bell Telephone Laboratories, Incorporated},
  filing_date = {1967-03-27},
  date        = {1969-10-28},
  url         = {https://patents.google.com/patent/US3475234A/en}
}

@patent{KleinFaggin1972,
  author      = {Klein, Thomas and Faggin, Federico},
  title       = {Doped Semiconductor Electrodes for MOS Type Devices},
  number      = {US3673471A},
  assignee    = {Fairchild Camera and Instrument Corporation},
  filing_date = {1970-10-08},
  date        = {1972-06-27},
  url         = {https://patents.google.com/patent/US3673471A/en}
}

@misc{Intel4004Datasheet,
  author       = {{Intel Corporation}},
  title        = {4004: Single Chip 4-Bit P-Channel Microprocessor},
  howpublished = {Data sheet},
  year         = {1974},
  url          = {https://archive.org/details/intel-4004}
}
```

***

## Eixo 3 — Parâmetros físicos, circuitos e métricas comparativas

### 1. Síntese técnica objetiva

#### Modelo de capacitância e atraso

A capacitância de sobreposição por terminal é

\[
C_{ov}=C_{ox}WL_{ov}=\frac{\varepsilon_{ox}}{t_{ox}}WL_{ov}.
\]

Para duas bordas, uma estimativa de primeira ordem da parcela total é \(C_{ov,tot}\approx2C_{ox}WL_{ov}\). Em porta metálica, \(L_{ov}\) inclui a margem de desalinhamento; em SGT autoalinhada, resta principalmente a difusão lateral e a franja. Como energia dinâmica por transição é \(E\approx C_LV^2\), reduzir \(C_{ov}\) reduz simultaneamente atraso e energia.

O atraso de primeira ordem pode ser escrito como

\[
\tau_{pd}\approx R_{on}C_L,
\qquad
t_{50\%}\approx0{,}69R_{eq}C_L.
\]

Para MOS de canal longo, \(R_{on}\) decresce aproximadamente com \(\mu C_{ox}(W/L)(V_{GS}-V_{th})\). A SGT atuou nos dois fatores: reduziu \(C_L\) por autoalinhamento e roteamento mais curto e reduziu \(|V_{th}|\), elevando a corrente de acionamento para a mesma alimentação.[^14]

#### Relógio e ciclo

A ficha técnica admite período de relógio entre 1,35 e 2,0 µs, correspondendo a 740,7–500 kHz. Um ciclo de instrução simples contém oito períodos:

\[
T_{inst}=8T_{clk}=8(1{,}35\ \mu s)=10{,}8\ \mu s,
\]

\[
f_{inst,max}=\frac{1}{10{,}8\ \mu s}\approx92{,}6\ \text{k instruções/s}.
\]

Instruções de dois *bytes* consomem 16 períodos, isto é, 21,6 µs no limite máximo. A frequência frequentemente citada de 740 kHz é, portanto, o inverso do período mínimo de 1,35 µs; o manual arredonda para 750 kHz.[^1]

#### Carga ativa com *bootstrapping*

Em uma carga PMOS simples, o nó de saída não alcança o trilho plenamente quando a sobretensão efetiva cai até o limiar. No circuito *bootstrap*, um capacitor acopla a transição de saída ao gate do transistor de carga, deslocando dinamicamente seu potencial e mantendo aproximadamente constante \(V_{GS}\). O transistor de carga opera próximo de fonte de corrente durante a transição, aumentando a corrente e levando a saída ao trilho sem a atenuação estática de \(|V_{th}|\).[^11]

Em termos ideais, se o gate flutua e a capacitância de acoplamento domina,

\[
\Delta V_G\approx\frac{C_B}{C_B+C_P}\Delta V_O,
\]

onde \(C_B\) é o capacitor de *bootstrap* e \(C_P\) agrega parasitas. Para \(C_B\gg C_P\), \(\Delta V_G\approx\Delta V_O\), de modo que \(V_{GS}=V_G-V_S\) permanece quase constante. Faggin afirmou que a técnica era essencial para atingir a relação velocidade/potência do 4004.[^10]

### 2. Fontes primárias

| Documento | Evidência |
|---|---|
| *4004: Single Chip 4-Bit P-Channel Microprocessor* | 10,8 µs por instrução, oito ou 16 períodos, alimentação e limites AC de 1,35–2,0 µs.[^1] |
| História oral Intel 8008/CHM | Faggin descreve a invenção da carga *bootstrap*, o contato enterrado e a metodologia de projeto.[^10] |
| História oral de Faggin | Explica o capacitor por inversão, \(V_{GS}\) quase constante e excursão até \(V_{DD}\).[^11] |
| “The MOS Silicon Gate Technology and the First Microprocessors” | Compara SGT e metal-gate: cerca de 5× em velocidade e 2× em densidade para lógica aleatória.[^20] |

### 3. Quadro de dados técnicos

| Métrica | Metal-gate PMOS | Silicon-gate PMOS | Base da comparação |
|---|---:|---:|---|
| Velocidade de lógica aleatória | 1× | 3–5×, chegando a cerca de 5× na mesma dissipação | Comparação de Faggin para projetos bifásicos.[^20] |
| Densidade de transistores | 1× | cerca de 2× | Mesmo tamanho de chip, lógica aleatória.[^20] |
| Fairchild 3705 vs. 3708 | 3705 = base | 3708: 4–5× mais rápido; resistência *on* 2,5–3× menor; fuga 10–100× menor | O intervalo reflete relatos posteriores distintos; deve ser reportado como tal.[^21][^20] |
| Área relativa para função equivalente | 1 | aproximadamente 0,5, como ordem de grandeza | Derivada da razão de densidade, não uma medida publicada do *die* 3705/3708. |
| 4004 | — | 12 mm²; aproximadamente 2.300 transistores; aproximadamente 192 transistores/mm² | Dados CHM; densidade calculada.[^13][^17] |

**Limite documental:** não foi localizada uma fonte primária que publique áreas de *die* comparáveis do 3705 metal-gate e do 3708 SGT. Portanto, uma tabela com mm² para ambos seria especulativa. O dado defensável é a relação de aproximadamente 2× em densidade para lógica aleatória; a área relativa de aproximadamente metade, para função e regras comparáveis, é dedução, não medição.[^20]

| Parâmetro temporal do 4004 | Valor |
|---|---:|
| \(T_{clk,min}\) | 1,35 µs[^1] |
| \(f_{clk,max}\) | aproximadamente 740,7 kHz |
| Fases | Duas, não sobrepostas, \(\phi_1\) e \(\phi_2\)[^1] |
| Períodos por ciclo simples | 8[^1] |
| \(T_{inst}\) simples | 10,8 µs[^1] |
| Taxa máxima teórica | aproximadamente 92,6 k instruções/s |
| Instrução de dois *bytes* | 16 períodos = 21,6 µs[^1] |

### 4. Registro BibTeX

```bibtex
@inproceedings{FagginEtAl1972MCS4,
  author    = {Faggin, Federico and Shima, Masatoshi and Hoff, Marcian E., Jr. and Feeney, Hal and Mazor, Stanley},
  title     = {The MCS-4---An LSI Micro Computer System},
  booktitle = {Proceedings of the IEEE Region Six Conference},
  year      = {1972},
  pages     = {1--6}
}

@article{FagginHoff1972FourChip,
  author  = {Faggin, Federico and Hoff, Marcian E., Jr.},
  title   = {Standard Parts and Custom Design Merge in Four-Chip Processor Kit},
  journal = {Electronics},
  year    = {1972},
  month   = apr,
  day     = {24},
  pages   = {112--116}
}

@article{Faggin2018Microprocessor,
  author  = {Faggin, Federico},
  title   = {The Making of the First Microprocessor},
  journal = {Nature Electronics},
  year    = {2018},
  volume  = {1},
  pages   = {6},
  doi     = {10.1038/s41928-017-0014-8}
}
```

***

## Eixo 4 — Transformações industriais, econômicas e sociais

### 1. Síntese técnica objetiva

#### Mudança do hardware para firmware

O manual MCS-4 define explicitamente a nova divisão de trabalho: a CPU padronizada executa controle e processamento; ROMs armazenam microprogramas e tabelas; RAMs guardam dados; portas e registradores conectam periféricos. A “personalidade” da máquina migra da fiação da placa para instruções gravadas em ROM, permitindo alterar funções sem redesenhar o circuito impresso.[^1]

Esse paradigma converteu custo não recorrente de lógica fixa em desenvolvimento de software/firmware e máscara de ROM. O ganho industrial não foi apenas menor quantidade de CIs: uma mesma plataforma podia atender variantes de produto, reduzir estoque, simplificar montagem e receber correções por alteração de programa. Faggin resumiu retrospectivamente que já em 1970 era claro que o projeto de sistemas migraria “from using hardware to software”.[^5]

#### Sistemas embarcados e aplicações

É necessário distinguir **aplicações propostas**, **protótipos demonstrados** e **produtos documentados**. O manual de 1973 lista controle de processos, máquinas numéricas, elevadores, tráfego rodoviário/ferroviário, periféricos, faturadoras, caixas registradoras, terminais de ponto de venda, eletrônica automotiva, médica e de teste; isso prova intenção comercial, mas não prova por si só instalações efetivas.[^1]

Aplicações com documentação mais firme incluem a calculadora Busicom 141-PF, primeiro produto comercial; o sistema de pinball *Spirit of '76* da Mirco, embora em baixa quantidade; e projetos suíços de bomba de combustível automatizada e medição de espessura para galvanoplastia. Alegações recorrentes de “balanças, semáforos, bombas e analisadores médicos” devem ser escritas com níveis de confiança: semáforos e medicina aparecem como categorias no manual; bomba de combustível tem projeto histórico identificado; para balanças comerciais e um modelo específico de analisador médico com 4004, não foi localizada nesta busca uma fonte primária inequívoca.[^22][^23][^24]

#### Trabalho, automação e fábrica

O microprocessador tornou economicamente viável inserir controle programável junto à máquina, substituindo relés, temporizadores, lógica TTL/MSI e, em etapas posteriores, parte do comando mecânico/eletromecânico. Em meados dos anos 1970, microprocessadores começaram a substituir módulos dedicados em máquinas-ferramenta, consolidando o CNC; programas e servomecanismos passaram a codificar movimentos antes executados ou ajustados pelo operador.[^25]

O impacto ocupacional não foi uma simples redução uniforme de emprego. Evidência econômica para a difusão do CNC aponta maior investimento e produtividade, queda de tarefas rotineiras e de trabalhadores com menor escolaridade, mas aumento de emprego agregado em indústrias mais expostas devido ao crescimento de funções com formação superior e tarefas abstratas. Assim, a formulação histórica rigorosa é **recomposição de tarefas e qualificações**: menos ajuste manual repetitivo e mais programação, manutenção, instrumentação, integração e supervisão.[^25]

#### Linhagem arquitetural

O 4004 inaugurou na Intel a prática de CPU monolítica e metodologia de lógica aleatória em SGT. Faggin posteriormente supervisionou/concluiu o 8008 e concebeu e liderou o 8080; o 8080 tornou-se a CPU do Altair 8800, apresentado em 1975 e amplamente associado ao início do mercado de microcomputadores pessoais.[^26][^27][^28]

Após sair da Intel, Faggin fundou a Zilog com Ralph Ungermann e concebeu o Z80 como sucessor compatível com o 8080; Shima realizou o projeto detalhado. O Z80 ampliou instruções e simplificou alimentação/interface, espalhando-se por computadores CP/M e sistemas embarcados. A relação com Apple I/II é **indireta e industrial**, não uma linhagem de ISA: ambos usaram o MOS Technology 6502, derivado do Motorola 6800, e não 4004/8080/Z80.[^27][^29][^30][^31]

### 2. Fontes primárias e secundárias

| Documento | Tipo | Evidência |
|---|---|---|
| *MCS-4 Users Manual* | Manual primário | Mudança de lógica aleatória para microprogramação; aplicações-alvo.[^1] |
| Comunicado Intel do 50º aniversário | Memória institucional | Plano inicial de 12 chips, conjunto de quatro e mudança hardware→software.[^5] |
| História oral do CHM | Fonte oral primária | Papéis técnicos, desenvolvimento e estratégia de aplicações.[^1] |
| História do Altair, CHM | Fonte museológica | Altair 8800, 1975, preço e impacto no *homebrew computing*.[^28] |
| “Computerized Machine Tools, Employment and Labor Market Dynamics” | Pesquisa econômica | Produtividade, emprego e mudança da composição de qualificações após CNC.[^25] |

### 3. Quadro de dados técnicos e sociais

| Transformação | Antes | Depois | Efeito observável |
|---|---|---|---|
| Implementação de controle | Relés, mecânica, SSI/MSI e placas específicas | CPU padrão + ROM/firmware | Reutilização de hardware e alteração por programa.[^1] |
| Variantes de produto | Nova fiação/placa | Nova imagem/máscara de ROM | Menor ciclo de redesenho e estoque.[^1] |
| Controle fabril | Sequências eletromecânicas ou NC dedicado | CNC com microprocessador e servos | Maior produtividade e codificação de movimentos.[^25] |
| Conteúdo do trabalho | Ajuste e operação rotineira | Programação, manutenção e supervisão | Polarização e elevação da demanda por qualificação técnica.[^25] |
| Microcomputador pessoal | Minicomputadores caros e kits experimentais | Altair 8800 com 8080; depois ecossistemas 8080/Z80 | Mercado de software, barramentos e computadores pessoais.[^28] |
| Apple I/II | — | 6502 | Ramo paralelo da revolução de 8 bits; não descendente direto do 4004.[^31] |

### 4. Registro BibTeX

```bibtex
@misc{Intel2021Fifty4004,
  author       = {{Intel Corporation}},
  title        = {Intel Marks 50th Anniversary of the Intel 4004},
  year         = {2021},
  month        = nov,
  day          = {15},
  url          = {https://download.intel.com/newsroom/archive/2025/en-us-2021-11-15-intel-marks-50th-anniversary-of-the-intel-4004.pdf}
}

@misc{CHMAltair8800,
  author       = {{Computer History Museum}},
  title        = {Altair 8800},
  howpublished = {CHM Revolution: Personal Computers},
  url          = {https://www.computerhistory.org/revolution/artifact/312/1140},
  urldate      = {2026-10-10}
}

@techreport{LewisEtAl2022CNC,
  author      = {Lewis, Ethan and others},
  title       = {Computerized Machine Tools, Employment, and Labor Market Dynamics},
  institution = {National Bureau of Economic Research},
  type        = {Working Paper},
  number      = {30400},
  year        = {2022},
  url         = {https://www.nber.org/papers/w30400}
}

@article{Faggin1996Impact,
  author  = {Faggin, Federico},
  title   = {The Microprocessor's Impact on Society},
  journal = {IEEE Micro},
  year    = {1996},
  volume  = {16},
  number  = {6},
  doi     = {10.1109/40.546565}
}
```

***

## Síntese para o artigo científico

A contribuição específica de Federico Faggin foi fechar a distância entre arquitetura e artefato industrial. Hoff e Mazor produziram a simplificação arquitetural; Shima assegurou que a máquina atendesse às calculadoras por meio de especificação, lógica, instruções e software; Faggin criou e aplicou a metodologia de circuitos e leiaute que tornou a CPU fabricável, usando a SGT, o contato enterrado e a carga *bootstrap*, e liderou a entrega dos quatro chips.[^10][^1]

A causalidade tecnológica pode ser formulada como uma cadeia: autoalinhamento reduziu \(L_{ov}\) e \(C_{ov}\); poli dopado reduziu e tornou mais controlável \(|V_{th}|\); *buried contacts* elevaram a roteabilidade; *bootstrapping* preservou excursão lógica e corrente de carga; a combinação reduziu \(R_{on}C_L\) e permitiu aproximadamente 2.300 transistores em 12 mm², com ciclo de 10,8 µs.[^13][^17] A consequência socioeconômica foi a separação entre plataforma física e função: sistemas deixaram de ser definidos exclusivamente por fiação e passaram a ser definidos por firmware, habilitando a expansão dos sistemas embarcados, a automação reprogramável e, por linhagens diretas e paralelas de 8 bits, o computador pessoal.

## Notas de cautela

- Não atribuir a US 3,475,234 à Fairchild ou a Faggin; ela pertence à Bell Labs e antecede a implementação industrial de Faggin/Klein.[^4]
- Não descrever o MCS-4 como CMOS: trata-se de PMOS de canal p, porta de silício, dimensão mínima de 10 µm.[^13]
- Não declarar que Hoff/Mazor fizeram o leiaute ou que Faggin inventou sozinho a arquitetura; separar arquitetura, especificação/aplicação e implementação física.[^1]
- Não apresentar Apple I/II como descendentes de ISA do 4004/8080/Z80; usaram o 6502.[^31]
- Não converter listas de aplicações do manual em prova automática de produtos instalados; diferenciar intenção comercial, protótipo e produto documentado.[^1]
- Não fornecer áreas absolutas de *die* para metal-gate versus SGT sem documento metrológico; usar relações de velocidade/densidade e identificar deduções.[^20]

---

## References

1. [Silicon Gate Technology Developed for ICs](https://www.computerhistory.org/siliconengine/silicon-gate-technology-developed-for-ics/)

2. [www.computerhistory.org › collections › catalogIntel 4004 microprocessor : oral history panel with Ted M. Hoff...](https://www.computerhistory.org/collections/catalog/102657974) - Ted Hoff and Stan Mazor describe their work on the design and development of Intel's first microproc...

3. [archive.computerhistory.org › resources › accessThe Intel 4004 Microprocessor: What Constituted Invention?](https://archive.computerhistory.org/resources/access/text/2017/03/102770826-05-01-acc.pdf)

4. [Method for making mis structures](https://patents.google.com/patent/US3475234A/en)

5. [Intel Marks 50th Anniversary of the Intel 4004](https://download.intel.com/newsroom/archive/2025/en-us-2021-11-15-intel-marks-50th-anniversary-of-the-intel-4004.pdf)

6. [How Ted Hoff Invented the First Microprocessor](https://spectrum.ieee.org/ted-hoff) - The rays of the rising sun have barely reached the foothills of Silicon Valley, but Marcian E. (Ted)...

7. [NEWHOTCHIPS](https://hc32.hotchips.org/assets/program/tutorials/HC2020.Microsoft.DavidReilly.v02.pdf)

8. [Who Invented the Integrated Circuit?](https://site.ieee.org/pikespeak/files/2020/06/Invention-of-the-Integrated-Circuit-Distribution-Final.pdf)

9. [Proceedings of the IRE](https://www.worldradiohistory.com/Archive-IRE/50s/IRE-1958-06.pdf)

10. [Oral History Panel on the Development and Promotion of the ...](https://archive.computerhistory.org/resources/text/Oral_History/Intel_8008/Intel_8008_1.oral_history.2006.102657982.pdf)

11. [Faggin Federico 1 2 3.oral History.2004.102658025 | PDF - Scribd](https://www.scribd.com/document/656273251/Faggin-Federico-1-2-3-oral-history-2004-102658025) - Federico Faggin was born in 1941 in Vicenza, Italy. He grew up interested in building mechanical thi...

12. [The history of the 4004 (1996) | Federico Faggin | 72 Citations](https://scispace.com/papers/the-history-of-the-4004-1llepz6ocj) - (DOI: 10.1109/40.546561) Twenty-five years ago, in November 1971, an advertisement appeared in Elect...

13. [www.computerhistory.org · revolution · storyIntel's Microprocessor - CHM Revolution](https://www.computerhistory.org/revolution/story/285) - The Intel 4004Commercial success rests on the ability to develop new technology… and the vision to r...

14. [Silicon Gate Technology - Intel 4004](http://www.intel4004.com/sgate.htm)

15. [Appendix 1](https://siliconthebook.com/appendices/appendix-1) - The MOS Silicon Gate Technology

16. [DOPED SEMICONDUCTOR ELECTRODES FOR MOS TYPE DEVICES](https://www.perplexity.ai/rest/file-repository/patents/US3673471A?lens_id=100-357-381-065-77X) - publication_number: US3673471A
abstract: The threshold voltage required to invert an MOS device is b...

17. [Intel 4004 CPU MCS-4 microcomputer set - CHM Revolution](https://www.computerhistory.org/revolution/artifact/285/1528) - The 4004 chip was manufactured on 2-inch diameter, p-channel silicon gate MOS technology wafers with...

18. [Earliest Published Papers](http://www.intel4004.com/papers.htm)

19. [[Retracted] A Comprehensive Examination of Bandgap ...](https://onlinelibrary.wiley.com/doi/10.1155/2021/3188506)

20. [The MOS Silicon Gate Technology and the First Microprocessors](http://intel4004.com/The_MOS_Silicon_Gate_Technology_and_the_First_Microprocessors.pdf)

21. [Issue 1 • Winter-2009](https://www.scribd.com/document/802540581/Issue-1-Winter-2009) - Scribd is the world's largest social reading and publishing site.

22. [The Prototype Calculator - The Intel 4004](http://www.intel4004.com/proto_calc.htm)

23. [4004!](https://www.technologizer.com/2011/11/15/intel-4004/2/index.html) - 4-bit. 2300 transistors. 740 kHz. On November 15th, 1971--forty years ago this Tuesday--Intel public...

24. [Le microprocesseur Intel 4004, 50 ans déjà!](https://www.museebolo.ch/en/memoires_vives/le-microprocesseur-intel-4004-50-ans-deja/)

25. [Computerized Machine Tools, Employment and ...](https://www.nber.org/system/files/working_papers/w30400/revisions/w30400.rev0.pdf)

26. [Microprocessor Inventor and NIHF Inductee Federico Faggin](https://www.invent.org/inductees/federico-faggin) - Microprocessor inventor and NIHF Inductee Federico Faggin joined the MOS group at Intel in 1970 as p...

27. [Creating the 8080: The Processor That Started the PC Revolution](https://www.pcmag.com/news/creating-the-8080-the-processor-that-started-the-pc-revolution) - If the introduction of the Intel 8008 led to a variety of interesting devices that can be considered...

28. [Altair 8800 - CHM Revolution - Computer History Museum](https://www.computerhistory.org/revolution/personal-computers/17/312/1140) - Popular Electronics featured the MITS Altair 8800 microcomputer kit in January 1975. Under $500, Alt...

29. [Founding Zilog, By Federico Faggin](https://www.electronicsweekly.com/blogs/mannerisms/yarns/founding-zilog-by-federico-fag-2008-08/) - The eighth, and last, in our Friday series on the early microprocessors is the story of Dr Federico ...

30. [Semiconductor Artifacts in the Silicon Engine Exhibit](https://archive.computerhistory.org/resources/access/text/2016/12/102762439-05-01-acc.pdf)

31. [Chip Hall of Fame: MOS Technology 6502 Microprocessor](https://spectrum.ieee.org/chip-hall-of-fame-mos-technology-6502-microprocessor) - From the heroic age of 8-bit CPUs, this processor powered the Apple II, Commodore 64, BBC Micro, and...

