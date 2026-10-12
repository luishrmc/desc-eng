# Relatório Técnico de Pesquisa e Modelagem Quantitativa para a Seção IV: Resultados

Este relatório consolida a investigação documental, analítica e física necessária para subsidiar a redação e expansão da Seção IV (Resultados) do artigo sobre Federico Faggin e o processador Intel 4004. O documento reúne formulações físicas exatas, valores paramétricos do processo de fabricação, especificações estruturadas para tabelas comparativas, levantamento histórico de aplicações industriais e mapeamento bibliográfico rigoroso.

---

## 1. Modelagem Física e Formulações Quantitativas do Processo PMOS SGT

### 1.1 Parâmetros Eletrostáticos do Óxido e Capacitância de Sobreposição

A capacitância específica por unidade de área do dielétrico de porta ($C_{ox}$) é governada pela permissividade dielétrica do dióxido de silício dividida pela espessura física da camada de óxido de porta ($t_{ox}$):
$$C_{ox} = \frac{\varepsilon_{ox}}{t_{ox}}$$

No processo PMOS de tecnologia de porta de silício (SGT) com largura litográfica nominal de 10 $\mu$m do Intel 4004, os valores físicos de referência documentados na caracterização de Faggin e Klein (1970) são:
- Espessura do óxido de porta: $t_{ox} \approx 100\text{ nm} = 1000\text{ \AA} = 10^{-5}\text{ cm}$.
- Constante dielétrica relativa do $\text{SiO}_2$: $\kappa_{ox} \approx 3{,}9$.
- Permissividade do vácuo: $\varepsilon_0 \approx 8{,}854 \times 10^{-14}\text{ F/cm}$.
- Permissividade dielétrica do dióxido de silício: $\varepsilon_{ox} = \kappa_{ox} \varepsilon_0 \approx 3{,}453 \times 10^{-13}\text{ F/cm} = 3{,}453 \times 10^{-11}\text{ F/m}$.

A capacitância específica resultante é:
$$C_{ox} = \frac{3{,}453 \times 10^{-13}\text{ F/cm}}{10^{-5}\text{ cm}} \approx 34{,}5\text{ nF/cm}^2 = 0{,}345\text{ fF/\mu m}^2$$

A capacitância parasita de sobreposição geométrica ($C_{ov}$) entre o eletrodo de porta e as regiões ativas de difusão de fonte ou dreno é modelada por:
$$C_{ov} = C_{ox} \cdot W \cdot L_{ov}$$
em que $W$ é a largura geométrica do canal e $L_{ov}$ é a extensão longitudinal da sobreposição entre a porta e a difusão subjacente.

No processo convencional de porta de alumínio, fonte e dreno eram introduzidos por difusão térmica antes da deposição do metal de porta. A imprecisão mecânica e óptica de alinhamento das máscaras fotolitográficas exigia uma margem de tolerância de projeto $\Delta L_{align}$ situada entre $3\ \mu\text{m}$ e $5\ \mu\text{m}$. O comprimento total de sobreposição correspondia a:
$$L_{ov,metal} = \Delta L_{align} + L_{diff,lat}$$
em que $L_{diff,lat} \approx 0{,}75 x_j$ representa a difusão lateral de dopantes sob a borda da máscara de óxido, sendo $x_j$ a profundidade de junção ($x_j \approx 1{,}0\ \mu\text{m}$ a $1{,}5\ \mu\text{m}$), resultando em $L_{diff,lat} \approx 0{,}75\ \mu\text{m}$ a $1{,}1\ \mu\text{m}$. Dessa forma, $L_{ov,metal}$ acumulava valores entre $3{,}75\ \mu\text{m}$ e $6{,}1\ \mu\text{m}$.

Na tecnologia SGT desenvolvida por Faggin, a camada de silício policristalino dopado é definida antes da formação das difusões de fonte e dreno, atuando como máscara física contra a introdução térmica de dopantes. Esse autoalinhamento elimina a tolerância de alinhamento litográfico:
$$\Delta L_{align} = 0$$

O comprimento de sobreposição residual fica restrito à difusão lateral térmica sob a borda do polissilício:
$$L_{ov,SGT} = L_{diff,lat} \approx 0{,}5\ \mu\text{m} \text{ a } 1{,}0\ \mu\text{m}$$

Como consequência, a capacitância de sobreposição geométrica por borda ($C_{ov}$) é reduzida por um fator de 3 a 5, o que representa uma diminuição de 60% a 80% em relação ao processo de porta de alumínio.

### 1.2 Atraso de Propagação, Resistência de Condução e Efeito Miller Dinâmico

O atraso de propagação de primeira ordem ($\tau_{pd}$) de uma porta lógica inversora MOS em comutação é proporcional ao produto da resistência equivalente de condução ($R_{on}$) e da capacitância total de carga vista pelo nó de saída ($C_L$):
$$\tau_{pd} \approx 0{,}69 R_{on} C_L \approx \frac{C_L \Delta V}{I_{on}}$$

A capacitância de carga total reúne componentes intrínsecas e parasitas:
$$C_L = C_{in,Miller} + C_{gate,next} + C_{junc} + C_{wire}$$

Durante a comutação de um estágio inversor, a capacitância de sobreposição porta-dreno ($C_{gd}$) é submetida ao efeito Miller dinâmico, refletindo na entrada uma capacitância equivalente expressa por:
$$C_{in,Miller} = C_{gd} (1 - A_v) = C_{gd} (1 + |A_v|)$$
em que $A_v = -g_m R_L$ é o ganho de tensão de pequenos sinais durante a transição ativa, tipicamente situado entre -3 e -5. Assim, $C_{gd} \approx C_{ox} W L_{ov}$ é multiplicada por um fator entre 4 e 6. Ao comprimir $L_{ov}$ para o limite da difusão lateral, o processo SGT reduz a parcela de Miller refletida no nó condutor anterior, aliviando o carregamento dinâmico.

A resistência de condução do canal em saturação e triodo é governada por:
$$R_{on} \approx \frac{L}{\mu_p C_{ox} W (|V_{GS}| - |V_{th}|)}$$

A redução da magnitude da tensão de limiar ($|V_{th}|$) obtida no SGT eleva a sobretensão de porta ($|V_{GS}| - |V_{th}|$) sob uma dada tensão de alimentação, aumentando a corrente de condução $I_{on}$ e reduzindo $R_{on}$. A combinação entre menor resistência de canal e menor capacitância de carga produz uma redução no atraso de propagação de até 5 vezes em comparação com dispositivos PMOS de porta de alumínio com a mesma geometria e potência dissipada.

### 1.3 Equacionamento Eletrostático da Tensão de Limiar e Função Trabalho

A tensão de limiar ($V_{th}$) de um transistor PMOS em substrato de silício tipo n é modelada por:
$$V_{th} = V_{FB} - 2\phi_F - \frac{Q_B}{C_{ox}}$$

A tensão de bandas planas ($V_{FB}$) expressa-se como:
$$V_{FB} = \Phi_{ms} - \frac{Q_{ss}}{C_{ox}}$$
em que $\Phi_{ms} = \Phi_m - \Phi_s$ é a diferença de função trabalho entre o eletrodo de porta e o substrato semicondutor, e $Q_{ss}$ é a densidade de cargas fixas na interface óxido-silício.

O potencial de Fermi de equilíbrio no substrato tipo n ($\phi_F$) e a densidade de carga espacial de depleção ($Q_B$) são determinados por:
$$\phi_F = \frac{k T}{q} \ln\left(\frac{N_D}{n_i}\right)$$
$$Q_B = \sqrt{2 q \varepsilon_{Si} N_D (2\phi_F + |V_{SB}|)}$$
sendo $N_D$ a concentração de doadores no substrato, $n_i$ a concentração intrínseca de portadores, $q$ a carga elementar, $\varepsilon_{Si}$ a permissividade do silício e $V_{SB}$ o potencial de corpo reverso.

Substituindo essas relações, a equação analítica completa de $V_{th}$ resulta em:
$$V_{th} = \Phi_{ms} - \frac{Q_{ss}}{C_{ox}} - 2\phi_F - \frac{\sqrt{2 q \varepsilon_{Si} N_D (2\phi_F + |V_{SB}|)}}{C_{ox}}$$

A substituição do alumínio por silício policristalino fortemente dopado com impurezas tipo p (boro) altera a diferença de função trabalho:
1. Para porta de alumínio sobre silício tipo n ($N_D \approx 10^{15}\text{ cm}^{-3}$): $\Phi_m \approx 4{,}10\text{ eV}$ e $\Phi_s \approx 4{,}31\text{ eV}$, fornecendo $\Phi_{ms,Al} \approx -0{,}21\text{ V}$.
2. Para porta de polissilício degenerado tipo $p^+$: o nível de Fermi coincide com o topo da banda de valência, gerando $\Phi_{poly(p^+)} \approx \chi + E_g \approx 4{,}05\text{ eV} + 1{,}12\text{ eV} = 5{,}17\text{ eV}$. Dessa forma, $\Phi_{ms,poly} \approx 5{,}17\text{ eV} - 4{,}31\text{ eV} \approx +0{,}86\text{ V}$.

O deslocamento líquido no potencial eletrostático é:
$$\Delta \Phi_{ms} = \Phi_{ms,poly} - \Phi_{ms,Al} \approx +0{,}86\text{ V} - (-0{,}21\text{ V}) \approx +1{,}07\text{ V} \approx +1{,}1\text{ V}$$

Como este acréscimo positivo atua diretamente na equação de $V_{th}$, a magnitude negativa da tensão de limiar PMOS diminui em cerca de 1,1 V em módulo, reduzindo os patamares de corte de níveis entre $-3{,}5\text{ V}$ e $-5{,}0\text{ V}$ no processo metálico para patamares entre $-1{,}5\text{ V}$ e $-2{,}5\text{ V}$ no processo SGT.

### 1.4 Cargas Fixas de Superfície, Orientação Cristalográfica e Gettering de Fósforo

O termo $-Q_{ss}/C_{ox}$ atua no sentido negativo na tensão de limiar PMOS porque $Q_{ss}$ apresenta polaridade positiva decorrente de ligações de silício interrompidas na interface. A intensidade de $Q_{ss}$ é dependente da orientação cristalográfica da lâmina de silício:
- Orientação <111>: apresenta densidade atômica superficial elevada, com densidades de carga de interface de $Q_{ss}/q \approx (4 \text{ a } 5) \times 10^{11}\text{ cm}^{-2}$. Com $C_{ox} \approx 34{,}5\text{ nF/cm}^2$, essa componente contribui com $-1{,}9\text{ V}$ a $-2{,}3\text{ V}$ no deslocamento de limiar, elevando $|V_{th}|$ para patamares entre $-3{,}5\text{ V}$ e $-5{,}0\text{ V}$.
- Orientação <100>: apresenta menor densidade atômica na superfície, permitindo reduzir a concentração de estados fixos para $Q_{ss}/q \approx (0{,}5 \text{ a } 1{,}0) \times 10^{11}\text{ cm}^{-2}$, o que comprime a contribuição de deslocamento para níveis entre $-0{,}2\text{ V}$ e $-0{,}5\text{ V}$.

A estrutura refratária do polissilício possibilitou a introdução da etapa térmica de captura iônica por fósforo (phosphorus gettering) com oxicloreto de fósforo ($\text{POCl}_3$) em temperaturas de $1000\,^\circ\text{C}$ a $1050\,^\circ\text{C}$. Esse tratamento forma uma camada superficial de vidro de fosfossilicato (PSG) que absorve íons alcalinos móveis, principalmente sódio ($\text{Na}^+$). Como resultado, o processo eliminou a deriva temporal de $V_{th}$ sob campo elétrico e reduziu a corrente de fuga reversa de junção em mais de duas ordens de magnitude em comparação com lâminas processadas com porta de alumínio.

### 1.5 Formulação Analítica da Frequência Máxima e Temporização do MCS-4

A frequência máxima de operação de uma malha lógica integrada relaciona-se aos parâmetros fundamentais do dispositivo pela expressão:
$$f_{max} \propto \frac{\mu_p \cdot C_{ox} \cdot (V_{DD} - |V_{th}|)^2}{L^2 \cdot C_L}$$
em que $\mu_p$ representa a mobilidade efetiva de lacunas no canal invertido ($\mu_p \approx 150 \text{ a } 200\text{ cm}^2/\text{V}\cdot\text{s}$), $L$ o comprimento efetivo do canal ($10\ \mu\text{m}$ no processo do Intel 4004), $V_{DD}$ a diferença de potencial entre trilhos e $C_L$ a capacitância total de carga.

No sistema MCS-4, a temporização é regida por um gerador de relógio bifásico não sobreposto com fases $\phi_1$ e $\phi_2$. As grandezas temporais documentadas na folha de dados técnica oficial (Intel, 1971) e no manual técnico (Intel, 1973) estabelecem:
- Período mínimo de relógio: $T_{clk,min} = 1{,}35\ \mu\text{s}$ a $1{,}36\ \mu\text{s}$.
- Frequência máxima de relógio: $f_{clk,max} = \frac{1}{1{,}35\ \mu\text{s}} \approx 740{,}7\text{ kHz}$ (arredondada comercialmente entre 740 kHz e 750 kHz).
- Ciclo de instrução de 1 palavra (8 bits): composto por 8 períodos consecutivos de relógio ($8 \times T_{clk}$), particionados nos subciclos A1, A2, A3, M1, M2, X1, X2 e B. Duração total: $T_{inst} = 8 \times 1{,}35\ \mu\text{s} = 10{,}8\ \mu\text{s}$.
- Taxa de vazão de processamento: $f_{inst,max} = \frac{1}{10{,}8\ \mu\text{s}} \approx 92.593\text{ instruções por segundo}$ (aproximadamente 92,6 kips).
- Ciclo de instrução de 2 palavras (16 bits): consome 16 períodos de relógio ($16 \times 1{,}35\ \mu\text{s}$), totalizando $21{,}6\ \mu\text{s}$.

### 1.6 Densidade de Integração e Ganho de Área com Contatos Enterrados

O chip Intel 4004 foi fabricado em lâminas de silício de 2 polegadas, apresentando pastilha com dimensões físicas de $3{,}0\text{ mm} \times 4{,}0\text{ mm}$, totalizando uma área de $12\text{ mm}^2$. A contagem física do projeto lógico detalhado totalizou 2.238 transistores PMOS, valor arredondado historicamente para 2.300 transistores.

A densidade de integração bruta do circuito integrado resulta em:
$$D_{int} = \frac{N_{\text{transistores}}}{\text{Área}} \approx \frac{2300}{12\text{ mm}^2} \approx 191{,}7\text{ transistores/mm}^2 \approx 192\text{ transistores/mm}^2$$

O fator determinante para atingir essa densidade em lógica aleatória não repetitiva foi o contato enterrado (buried contact), concebido por Faggin na Fairchild e introduzido no projeto do 4004. O contato enterrado estabelece uma junção ôhmica direta silício-silício entre a camada condutora de polissilício e a difusão no substrato monocristalino sem a intermediação de uma camada de alumínio.

No arranjo convencional de porta metálica, a conexão de uma porta com uma difusão exigia duas aberturas de contato verticais metal-semicondutor e uma ilha metálica de alumínio cobrindo ambas, sujeita a regras de afastamento e folgas de segurança de óxido espesso. O contato enterrado dispensou essas ilhas de alumínio e vias metálicas verticais, resultando em uma redução média de 50% na área de células de lógica aleatória. Sem essa inovação, a implementação física da CPU ultrapassaria a área de $20\text{ mm}^2$, inviabilizando o rendimento de fabricação nos padrões industriais de 1970 e 1971.

### 1.7 Princípio de Operação e Equacionamento do Bootstrapping Dinâmico em Cargas Ativas

Em circuitos lógicos PMOS convencionais que utilizam transistores de carga ativos no modo de enriquecimento (enhancement pull-up), o nó de saída sofre atenuação de nível. Quando o canal pull-up conduz para elevar a saída rumo a $V_{DD}$, o potencial da fonte acompanha a tensão de saída, reduzindo o módulo da tensão porta-fonte $|V_{GS}| = |V_G - V_{out}|$. Ao atingir o limiar de corte:
$$V_{out,max} = V_{DD} - |V_{th}|$$
o canal entra em corte pois $|V_{GS}| \le |V_{th}|$. Essa limitação provoca a perda de uma tensão de limiar inteira no nível lógico alto de saída, reduzindo as margens de ruído e degradando as transições de subida à medida que a corrente de dreno decai quadraticamente.

Para superar essa restrição sem recorrer a fontes de alimentação auxiliares, Faggin desenvolveu circuitos de carga com bootstrapping capacitivo dinâmico. O circuito é constituído por um transistor de amostragem e isolamento, um transistor de carga pull-up cujo terminal de porta constitui um nó dinâmico flutuante ($N_G$), e um capacitor integrado explícito ($C_B$) conectado entre o nó de saída ($V_{out}$) e o nó $N_G$.

O ciclo operacional divide-se em duas etapas:
1. Pré-carga e isolamento: durante a fase preparatória, o transistor de isolamento conduz e carrega o nó $N_G$ a um potencial de pré-carga. Em seguida, o transistor de isolamento é cortado, deixando o nó $N_G$ isolado em alta impedância.
2. Elevação capacitiva (bootstrapping): quando o estágio lógico comuta e a saída transita em direção a $V_{DD}$, a variação de potencial $\Delta V_{out}$ é transferida ao nó de porta flutuante por divisão capacitiva:
$$\Delta V_G = \left(\frac{C_B}{C_B + C_P}\right) \Delta V_{out}$$
em que $C_P$ congrega as capacitâncias parasitas associadas ao nó $N_G$.

Dimensionando o capacitor integrado de modo que $C_B \gg C_P$, obtém-se:
$$\Delta V_G \approx \Delta V_{out}$$

O potencial dinâmico no terminal de porta é deslocado além do trilho de alimentação:
$$V_G(t) \approx V_{G,inicial} + \Delta V_{out}$$

Essa sobretensão dinâmica mantém o módulo $|V_{GS}|$ substancialmente superior a $|V_{th}|$ durante toda a excursão de subida. O transistor de carga permanece na região de condução linear (triodo), permitindo que o nó de saída atinja integralmente o potencial do trilho ($V_{out} = V_{DD}$). A restauração plena da excursão lógica assegura margens de ruído elevadas nos barramentos internos e tempos de subida reduzidos.

---

## 2. Especificação e Dados Estruturados para as Tabelas da Seção IV

### 2.1 Tabela 1: Comparativo Tecnológico Quantitativo entre Porta de Alumínio e Porta de Silício (SGT)

| Parâmetro Técnico | Processo PMOS com Porta de Alumínio | Processo PMOS com Porta de Silício (SGT) | Base Documental e Fundamento Físico |
|---|---|---|---|
| Tolerância de alinhamento ($\Delta L_{align}$) | $3\ \mu\text{m}$ a $5\ \mu\text{m}$ | $0\ \mu\text{m}$ (nula) | Autoalinhamento da porta como máscara de difusão de fonte e dreno (Kerwin et al., 1969, Faggin e Klein, 1970) |
| Comprimento de sobreposição ($L_{ov}$) | $3{,}5\ \mu\text{m}$ a $6{,}0\ \mu\text{m}$ | $0{,}5\ \mu\text{m}$ a $1{,}0\ \mu\text{m}$ | Sobreposição restrita unicamente à difusão lateral de dopantes sob o óxido (Faggin e Klein, 1970) |
| Capacitância de sobreposição ($C_{ov}$) | $1{,}2\text{ a } 2{,}1\text{ fF/\mu m}$ de largura de canal | $0{,}17\text{ a } 0{,}35\text{ fF/\mu m}$ de largura de canal | Redução direta de 60% a 80% na capacitância parasitária de borda com $C_{ox} \approx 0{,}345\text{ fF/\mu m}^2$ |
| Efeito Miller dinâmico em $C_{gd}$ | $C_{in,Miller} \approx (4 \text{ a } 6) \times C_{gd,metal}$ | $C_{in,Miller} \approx (4 \text{ a } 6) \times C_{gd,SGT}$ | Amplificação por $(1 + |A_v|)$, com valor absoluto de $C_{gd}$ reduzido em até 5 vezes |
| Tensão de limiar nativa ($V_{th}$) | $-3{,}5\text{ V}$ a $-5{,}0\text{ V}$ | $-1{,}5\text{ V}$ a $-2{,}5\text{ V}$ | Redução de 1,1 V devida à função trabalho do polissilício $p^+$ ($\Delta \Phi_{ms}$) e lâminas <100> (Klein e Faggin, 1972) |
| Tensão de alimentação ($V_{DD}$) | $-24\text{ V}$ a $-28\text{ V}$ | $15\text{ V}$ entre trilhos ($V_{SS} - V_{DD}$) | Datasheet MCS-4: operação com trilhos $V_{SS} = +5\text{ V}$ e $V_{DD} = -10\text{ V}$, ou $0\text{ V}$ e $-15\text{ V}$ |
| Interface com circuitos TTL | Incompatível diretamente, exige conversores | Compatível em nível alto através do trilho $+5\text{ V}$ | Eliminação de conversores de nível na interface com famílias lógicas bipolares (Intel, 1971) |
| Frequência máxima de relógio | Menor que $150\text{ kHz}$ | $740\text{ kHz}$ a $750\text{ kHz}$ | Aumento de até 5 vezes em velocidade na mesma litografia de 10 $\mu$m (Intel, 1971, Faggin et al., 1996) |
| Camadas condutoras para roteamento | Camada única de metalização (alumínio) | Duas camadas condutoras (polissilício e alumínio) | Polissilício dopado com contatos enterrados elimina túneis difusos no substrato (Vadasz, 1972) |
| Densidade bruta de transistores | Estimada em $90\text{ a } 100\text{ transistores/mm}^2$ | $192\text{ transistores/mm}^2$ (2.300 transistores em 12 mm²) | Ganho de densidade de 2 vezes decorrente do roteamento duplo e contatos enterrados (Faggin, 2018) |
| Estabilidade de limiar e fuga | Suscetível a desvios iônicos e spikes de alumínio | Fuga mais de 100 vezes menor e sem deriva | Tratamento térmico refratário com captura iônica por fósforo em $\text{POCl}_3$ (Faggin e Klein, 1970) |

### 2.2 Tabela 2: Inovações Técnicas de Faggin, Princípios Físicos e Desdobramentos Industriais

| Inovação Técnica e Ano | Princípio Físico e Formulação Analítica | Aplicações e Desdobramentos Industriais |
|---|---|---|
| Porta autoalinhada de silício (SGT, 1968-1970) | Autoalinhamento da porta como barreira térmica: $\Delta L_{align} = 0$, $L_{ov} = L_{diff,lat}$. Função trabalho: $\Delta \Phi_{ms} \approx +1{,}1\text{ V}$. Redução de limiar: $V_{th} = \Phi_{ms} - Q_{ss}/C_{ox} - 2\phi_F - Q_B/C_{ox}$. | Fairchild 3708, memórias DRAM Intel 1103, aumento de 5 vezes na frequência e redução de dissipação de potência. |
| Contato enterrado (Buried Contact, 1968-1970) | Junção ôhmica direta polissilício-difusão monocristalina sem alumínio. Ganho de área: $\text{Área}_{\text{célula}} \to \text{redução de 50\%}$. | Viabilização física da pastilha do 4004 em 12 mm², eliminação de vias metálicas verticais e regras de afastamento. |
| Carga ativa com bootstrapping dinâmico (1970-1971) | Acoplamento dinâmico em nó flutuante: $\Delta V_G = \frac{C_B}{C_B + C_P}\Delta V_{out} \approx \Delta V_{out}$. Manutenção de $|V_{GS}| > |V_{th}|$ conduzindo a saída ao trilho pleno $V_{out} = V_{DD}$. | Eliminação da degradação de limiar, restauração das margens de ruído em barramentos internos e portas lógicas dinâmicas rápidas. |
| Metodologia de roteamento ortogonal em lógica aleatória (1970-1971) | Partição espacial em dois eixos perpendiculares: polissilício no eixo vertical e metalização de alumínio no eixo horizontal, integrados por contatos enterrados. | Concretização do layout manual de 2.300 transistores em lógica aleatória não regular, padronização do fluxo integrado lógica-circuito-layout. |
| Barramento multiplexado em encapsulamento DIP de 16 pinos (1970-1971) | Compartilhamento temporal em barramento bidirecional de 4 bits sob relógio bifásico com oito subciclos de temporização: $T_{inst} = 8 T_{clk} = 10{,}8\ \mu\text{s}$. | Superação do limite mecânico e de custo do encapsulamento cerâmico padrão de 16 pinos, coordenação sincronizada da família MCS-4 (4001, 4002, 4003, 4004). |

---

## 3. Impactos Sociotécnicos e Industriais Documentados

### 3.1 Transição de Paradigma: Da Lógica Fixa SSI/MSI para Firmware em ROM/RAM
- Redução de complexidade de placa: uma placa com o conjunto MCS-4 substituiu cerca de 90 encapsulamentos lógicos TTL SSI/MSI em projetos típicos de controle.
- Redução de custos de engenharia não recorrente (NRE): correções de algoritmos executadas por atualização de código binário em máscaras de ROM ou EPROM, dispensando redesenho físico de placas.
- Compressão do ciclo de desenvolvimento de novos equipamentos de meses para semanas.

### 3.2 Emergência dos Sistemas Embarcados e Aplicações Comerciais Documentadas
- Calculadora Busicom 141-PF (1971): aplicação contratante inaugural.
- Analisador hematológico da Helena Laboratories: redução de três placas dedicadas para placa única, diminuindo volume em 50% e custo fabril em 30%.
- Balanças comerciais computadorizadas com cálculo instantâneo de preço por unidade de peso.
- Controladores de tráfego e semáforos urbanos adaptativos.
- Bombas de combustível automatizadas e caixas registradoras de ponto de venda (POS).
- Jogos operados por moedas (máquina de pinball Spirit of 76 da Mirco Games).

### 3.3 Automação Industrial, Robótica e Recomposição do Trabalho
- Robô industrial pioneiro ASEA IRB 6 (1974): primeiro manipulador elétrico controlado por microprocessador (Intel 8008 derivado da tecnologia SGT consolidada no 4004).
- Aumento do tempo médio entre falhas (MTBF) pela eliminação de contatos mecânicos e fiações manuais.
- Recomposição do trabalho: transferência de postos de montagem física repetitiva para funções de programação em Assembly, manutenção eletrônica e engenharia de sistemas.

### 3.4 Alicerce da Microcomputação e Linhagem Técnica (8008, 8080, Z80 e Distinção do 6502)
- Intel 8008 (1972): primeiro processador de 8 bits em PMOS SGT com 3.500 transistores e endereçamento de 16 KBytes.
- Intel 8080 (1974): projetado por Faggin e Shima em NMOS SGT de 6 $\mu$m com 2 MHz e ponteiro de pilha em RAM externa, servindo de núcleo ao Altair 8800 (1975).
- Zilog Z80 (1976): concebido por Faggin e Shima, com refrescamento embutido de DRAM e registradores estendidos, dominando a era do sistema CP/M.
- Ressalva historiográfica sobre o MOS 6502: arquitetura independente projetada por Chuck Peddle a partir do 6800, sem parentesco com a linhagem técnica Faggin na Intel/Zilog.
