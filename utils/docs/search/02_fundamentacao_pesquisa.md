# Relatório de Pesquisa Documental e Modelagem Técnica para a Seção II: Fundamentação Teórica

Este relatório consolida a fundamentação técnica, física e arquitetural necessária para a redação da Seção II (arquivo secoes/02_fundamentacao.tex), baseando-se nas fontes primárias dos arquivos em utils/docs/search, nos slides de Aula4.pdf e na literatura seminal da microeletrônica.

***

## 1. Modelagem Física e Eletrostática da Porta de Alumínio vs. SGT

### 1.1 Expressões Analíticas de Capacitância e Efeito Miller

Nos transistores de efeito de campo Metal-Óxido-Semicondutor (MOS), a capacitância específica por unidade de área do dielétrico de porta ($C_{ox}$) é definida pela permissividade dielétrica do dióxido de silício ($\varepsilon_{ox} = \kappa_{ox}\varepsilon_0 \approx 3{,}45 \times 10^{-13}\text{ F/cm}$, com $\kappa_{ox} \approx 3{,}9$) dividida pela espessura física do óxido de porta ($t_{ox}$):

$$C_{ox} = \frac{\varepsilon_{ox}}{t_{ox}}$$

A capacitância de sobreposição geométrica ($C_{ov}$) entre a porta e as regiões ativas de difusão de fonte ou dreno é modelada por:

$$C_{ov} = C_{ox} W L_{ov}$$

onde $W$ é a largura física do canal e $L_{ov}$ é o comprimento longitudinal de sobreposição entre a porta condutora e a região dopada adjacente.

No processo convencional com porta de alumínio, as regiões de fonte e dreno eram introduzidas no substrato por difusão térmica antes da deposição do metal de porta. Devido às imprecisões de alinhamento mecânico e óptico das fotomáscaras litográficas da época, o desenho exigia uma margem geométrica de tolerância $\Delta L_{align}$ tipicamente situada entre $3\,\mu\text{m}$ e $5\,\mu\text{m}$. O comprimento total de sobreposição correspondia a:

$$L_{ov,metal} = \Delta L_{align} + L_{diff,lat}$$

onde $L_{diff,lat} \approx 0{,}75 x_j$ representa a difusão lateral de impurezas sob a borda da máscara, sendo $x_j$ a profundidade de junção.

Na Tecnologia de Porta de Silício (SGT), o silício policristalino dopado é gravado antes das difusões de fonte e dreno, funcionando como máscara física impenetrável durante o processo de dopagem (autoalinhamento). Esse arranjo elimina a parcela de tolerância fotolitográfica ($\Delta L_{align} = 0$), restando unicamente a difusão lateral térmica inevitável:

$$L_{ov,SGT} = L_{diff,lat}$$

Como resultado, a capacitância de sobreposição residual por borda é comprimida por um fator entre 3 e 5, o que representa uma diminuição de 60% a 80% em comparação com o processo de porta metálica.

O impacto da redução de $C_{ov}$ é amplificado na capacitância porta-dreno ($C_{gd}$) em estágios inversores devido ao Efeito Miller. A capacitância dinâmica de entrada efetiva associada ao nó porta-dreno ($C_{in,Miller}$) durante a excursão transitória de comutação é expressa por:

$$C_{in,Miller} = C_{gd} (1 - A_v) = C_{gd} (1 + |A_v|)$$

onde $A_v = -g_m R_L$ é o ganho de tensão de pequenos sinais do estágio inversor durante a travessia da região ativa. Em portas lógicas com ganhos de tensão entre 3 e 5, a capacitância física $C_{gd} \approx C_{ox} W L_{ov,d}$ é multiplicada por um fator entre 4 e 6. Ao suprimir a sobreposição litográfica deliberada, o processo SGT minimiza a carga dinâmica de comutação do circuito.

### 1.2 Atraso de Comutação e Frequência Máxima

O atraso de propagação de primeira ordem ($\tau_{pd}$) de uma porta lógica inversora MOS é governado pelo produto da resistência equivalente de condução ($R_{on}$) e da capacitância total de carga vista pelo nó de comutação ($C_L$):

$$\tau_{pd} \approx 0{,}69 R_{on} C_L \approx \frac{C_L \Delta V}{I_{on}}$$

A capacitância de carga reúne as componentes de sobreposição com efeito Miller, a capacitância de porta do estágio subsequente, as capacitâncias parasitas de junção polarizada reversamente ($C_{junc}$) e a capacitância de interconexão:

$$C_L = C_{gd} (1 + |A_v|) + C_{gate,next} + C_{junc} + C_{wire}$$

A minimização de $C_{gd}$ e a diminuição das linhas de interconexão proporcionadas pela SGT permitiram uma redução direta de $C_L$. Simultaneamente, o aumento da corrente de dreno em condução ($I_{on}$) proporcionado por um maior overdrive de porta reduziu $R_{on}$. Em consequência, o atraso de propagação por estágio diminuiu por um fator de até 5 vezes em comparação com dispositivos PMOS de porta metálica sob mesmo consumo de potência, viabilizando frequências de clock entre 740 kHz e 750 kHz no Intel 4004.

### 1.3 Equação Analítica da Tensão de Limiar e Função Trabalho

A tensão de limiar ($V_{th}$) de um transistor PMOS de enriquecimento, fabricado sobre substrato de silício monocristalino tipo n, é modelada pela relação eletrostática fundamental:

$$V_{th} = V_{FB} - 2\phi_F - \frac{Q_B}{C_{ox}}$$

A tensão de bandas planas ($V_{FB}$) é definida por:

$$V_{FB} = \Phi_{ms} - \frac{Q_{ss}}{C_{ox}}$$

onde $\Phi_{ms} = \Phi_m - \Phi_s$ é a diferença de função trabalho entre o eletrodo de porta e o semicondutor, e $Q_{ss}$ representa a densidade superficial de cargas fixas positivas na interface óxido-semicondutor.

O potencial de Fermi de equilíbrio no substrato tipo n ($\phi_F$) e a densidade de carga espacial de depleção ($Q_B$) são expressos por:

$$\phi_F = \frac{k T}{q} \ln\left(\frac{N_D}{n_i}\right)$$

$$Q_B = \sqrt{2 q \varepsilon_{Si} N_D (2\phi_F + |V_{SB}|)}$$

sendo $N_D$ a concentração de dopantes doadores no substrato, $n_i$ a concentração intrínseca de portadores, $q$ a carga elementar do elétron, $\varepsilon_{Si}$ a permissividade do silício e $V_{SB}$ a polarização reversa de corpo (body bias).

Substituindo essas relações, obtém-se a equação expandida para a tensão de limiar PMOS:

$$V_{th} = \Phi_{ms} - \frac{Q_{ss}}{C_{ox}} - 2\phi_F - \frac{\sqrt{2 q \varepsilon_{Si} N_D (2\phi_F + |V_{SB}|)}}{C_{ox}}$$

A substituição do alumínio por silício policristalino fortemente dopado com boro ($p^+$) altera drasticamente o termo $\Phi_{ms}$:

1. Para porta de alumínio sobre silício tipo n: $\Phi_m \approx 4{,}10\text{ eV}$ e $\Phi_s \approx 4{,}31\text{ eV}$, resultando em $\Phi_{ms,Al} \approx -0{,}21\text{ V}$.
2. Para porta de polissilício tipo $p^+$ degenerado: o nível de Fermi localiza-se próximo ao topo da banda de valência, fornecendo $\Phi_{poly(p^+)} \approx \chi + E_g \approx 4{,}05\text{ eV} + 1{,}12\text{ eV} = 5{,}17\text{ eV}$. Com isso, $\Phi_{ms,poly} \approx 5{,}17\text{ eV} - 4{,}31\text{ eV} \approx +0{,}86\text{ V}$.

A diferença líquida no termo eletrostático é calculada como:

$$\Delta \Phi_{ms} = \Phi_{ms,poly} - \Phi_{ms,Al} \approx +0{,}86\text{ V} - (-0{,}21\text{ V}) \approx +1{,}07\text{ V} \approx +1{,}1\text{ V}$$

Como este acréscimo positivo atua diretamente na equação de $V_{th}$, a magnitude negativa da tensão de limiar em dispositivos PMOS é reduzida em aproximadamente $1{,}1\text{ V}$ em módulo (por exemplo, de $-3{,}5\text{ V}$ para $-2{,}4\text{ V}$), aproximando a tensão de corte de níveis lógicos mais baixos e aumentando a corrente de saturação sob alimentação moderada.

### 1.4 Cargas Fixas de Interface e Orientação Cristalina (<111> vs. <100>)

O termo $-Q_{ss}/C_{ox}$ exerce influência desfavorável em transistores PMOS porque $Q_{ss}$ é invariavelmente positivo devido a íons residuais e átomos de silício incompletamente coordenados na transição de rede. Portanto, $-Q_{ss}/C_{ox} < 0$, o que desloca $V_{th}$ para magnitudes ainda mais negativas.

A magnitude de $Q_{ss}$ depende criticamente da orientação do plano cristalográfico da lâmina de silício:

1. Orientação <111>: Apresenta densidade atômica superficial mais alta, resultando em concentrações de carga de interface de $Q_{ss}/q \approx (4 \text{ a } 5) \times 10^{11}\text{ cm}^{-2}$. Em processos com óxido de porta de $100\text{ nm}$ ($C_{ox} \approx 34{,}5\text{ nF/cm}^2$), esta componente contribui com cerca de $-1{,}9\text{ V}$ a $-2{,}3\text{ V}$ para a tensão de limiar, elevando o $|V_{th}|$ total para níveis entre $-3{,}5\text{ V}$ e $-5{,}0\text{ V}$.
2. Orientação <100>: Apresenta densidade atômica superficial menor, permitindo reduzir a densidade de carga fixa para $Q_{ss}/q \approx (0{,}5 \text{ a } 1{,}0) \times 10^{11}\text{ cm}^{-2}$, o que reduz o deslocamento associado para patamares entre $-0{,}2\text{ V}$ e $-0{,}5\text{ V}$.

No início da era MOS, lâminas <111> eram preferidas na indústria para evitar canais parasitas de inversão sob o óxido espesso de campo. A SGT de Faggin e Klein combinou o ajuste de $\Phi_{ms}$ com tratamentos de recozimento e purificação em alta temperatura, obtendo tensões de limiar reprodutíveis entre $-1{,}5\text{ V}$ e $-2{,}5\text{ V}$.

### 1.5 Comparativo de Tensões de Alimentação, Margem de Ruído e Compatibilidade TTL

| Parâmetro Técnico | PMOS de Porta Metálica (Alumínio) | PMOS de Porta de Silício (SGT) |
|---|---|---|
| Tensão de limiar nativa ($V_{th}$) | $-3{,}5\text{ V}$ a $-5{,}0\text{ V}$ | $-1{,}5\text{ V}$ a $-2{,}5\text{ V}$ |
| Tensão de alimentação nominal | $-24\text{ V}$ a $-28\text{ V}$ | $15\text{ V}$ entre trilhos ($V_{SS} - V_{DD}$) |
| Referência de potencial MCS-4 | Trilho negativo único não compatível | $V_{SS} = +5\text{ V}$ e $V_{DD} = -10\text{ V}$ (ou $0\text{ V}$ e $-15\text{ V}$) |
| Compatibilidade de interface TTL | Incompatível, necessitava conversores de nível | Compatível diretamente no nível alto ($V_{SS} = +5\text{ V}$) |
| Excursão lógica de saída ($V_{out}$) | Reduzida por corte em $V_{DD} - |V_{th}|$ | Excursão completa até $V_{DD}$ com circuito bootstrap |
| Margem de ruído lógico | Degradada pela atenuação de limiar | Maximizada pela excursão total até os trilhos |

Ao adotar $V_{SS} = +5\text{ V}$ e $V_{DD} = -10\text{ V}$, a diferença de potencial exigida pelo circuito interno do 4004 permaneceu em $15\text{ V}$, mas o trilho superior coincidiu com a linha de alimentação padrão de circuitos lógicos TTL bipolares (+5 V). O nível de saída alto do MCS-4 atingia tensões próximas a $+5\text{ V}$, permitindo o acionamento direto de portas lógicas TTL sem circuitos conversores adicionais.

***

## 2. Propriedades Estruturais e Térmicas do Silício Policristalino

### 2.1 Comportamento Térmico Refratário versus Limite Térmico do Alumínio

O silício monocristalino possui ponto de fusão em $1414\,^\circ\text{C}$. O filme de silício policristalino depositado por Deposição Química em Fase de Vapor (CVD) mantém estabilidade estrutural mecânica em temperaturas superiores a $1100\,^\circ\text{C}$. Essa propriedade refratária permite que o polissilício seja depositado e padronizado litograficamente antes das etapas térmicas de difusão de fonte e dreno, as quais ocorrem em fornos a temperaturas de $1050\,^\circ\text{C}$ a $1150\,^\circ\text{C}$.

Em contraste, o alumínio funde a $660\,^\circ\text{C}$ e forma uma fase eutética líquida com o silício monocristalino a uma temperatura de apenas $577\,^\circ\text{C}$. Por essa razão, no processo tradicional de porta metálica, a deposição do alumínio ocorria obrigatoriamente após todas as etapas de alta temperatura.

### 2.2 Mecanismo Físico de Spiking por Alumínio

Em temperaturas de processamento superiores a $450\,^\circ\text{C}$, o silício dissolve-se no alumínio sólido adjacente em proporções governadas pelo diagrama de fases. Essa dissolução heterogênea ocorre preferencialmente em pontos com defeitos pontuais de rede no monocristal.

Durante o resfriamento, o transporte atômico difusivo faz com que átomos de alumínio migrem para preencher as cavidades criadas no silício, gerando microfilamentos condutores pontiagudos conhecidos como spikes de alumínio. Em transistores MOS de junção rasa ($x_j \le 2\,\mu\text{m}$), esses spikes perfuram a profundidade da junção $p-n$, conectando eletricamente a fonte ou dreno ao substrato tipo n, inutilizando o dispositivo por curto-circuito de corrente reversa.

A estabilidade refratária do polissilício viabilizou o processo de captura iônica por fósforo (phosphorus gettering) em etapas posteriores com oxicloreto de fósforo ($\text{POCl}_3$) a temperaturas de $1000\,^\circ\text{C}$ a $1050\,^\circ\text{C}$. Essa etapa absorveu íons alcalinos migrantes (especialmente sódio, $\text{Na}^+$) no vidro de fosfossilicato superficial (PSG), suprimindo a deriva temporal de $V_{th}$ e reduzindo as correntes de fuga das junções em mais de duas ordens de grandeza.

### 2.3 Segunda Camada Condutora de Interconexão e Eliminação de Túneis Difusos

Nos circuitos integrados MOS de porta metálica com camada condutora única de alumínio, o cruzamento de duas linhas de sinal sem conexão elétrica dependia de túneis difusos no substrato (diffused cross-unders). O sinal abandonava a trilha metálica, penetrava em uma difusão $p^+$ alongada no silício e retornava à superfície por uma segunda via de contato metálica.

Os túneis difusos impunham três penalidades severas ao desempenho:

1. Elevada resistência de folha: difusões $p^+$ exibiam resistências entre $30\,\Omega/\square$ e $100\,\Omega/\square$, introduzindo atrasos de propagação resistivos em linhas de controle e relógio.
2. Capacitância parasita de junção: o túnel difuso atuava como uma junção polarizada reversamente de grande área superficial com o substrato, multiplicando a capacitância associada ao nó de sinal.
3. Desperdício de área de lâmina: cada extremidade de túnel demandava aberturas de contato metal-difusão, anéis de isolamento e folgas de segurança para óxido espesso, elevando a área do chip.

Com a SGT, o silício policristalino dopado depositado sobre o óxido de campo passa a atuar como uma segunda camada condutora independente. Linhas de polissilício conduzem sinais em um nível intermediário, enquanto a metalização de alumínio corre no nível superior, separada por uma camada dielétrica de isolamento. O cruzamento entre pistas condutoras ocorre sem o uso de túneis difusos, eliminando as resistências parasitas de substrato e aumentando a densidade topológica de empacotamento em circuitos lógicos.

***

## 3. Inovações de Circuito e Metodologia de Layout no Intel 4004

### 3.1 Contatos Enterrados (Buried Contacts)

O contato enterrado, introduzido por Federico Faggin na Fairchild em 1968 e aplicado no projeto do Intel 4004 em 1970, estabelece uma ligação ôhmica direta entre a camada de polissilício e a região de difusão monocristalina no substrato, sem a necessidade de uma janela de contato vertical preenchida por alumínio.

O fluxo de fabricação opera de forma estruturada:

1. Antes da deposição do polissilício, uma etapa fotolitográfica remove o óxido térmico fino nas áreas selecionadas onde a porta ou interconexão de polissilício deve se unir à difusão do substrato.
2. O silício policristalino é depositado sobre toda a superfície da lâmina, estabelecendo contato íntimo com o silício monocristalino exposto nas aberturas.
3. Durante a etapa térmica subsequente de difusão de boro, as espécies dopantes movem-se rapidamente através da matriz policristalina e penetram no monocristal subjacente, gerando uma região $p^+$ contínua e formando uma transição ôhmica direta silício-silício.

Em células lógicas e matrizes de registradores, ligar a porta de um transistor ao dreno de outro exigia previamente duas aberturas de contato metal-difusão e metal-polissilício, mais uma ilha de alumínio cobrindo ambas com regras rígidas de afastamento geométrico. O contato enterrado ocupa uma fração dessa área e elimina as regras de proximidade do metal. Essa inovação foi determinante para reduzir a área física do 4004 para $12\text{ mm}^2$, viabilizando a integração de 2300 transistores.

### 3.2 Cargas Ativas com Bootstrapping Dinâmico

Em circuitos lógicos PMOS convencionais que utilizam transistores de carga ativos no modo de enriquecimento (enhancement load), o transistor de pull-up é conectado com sua porta polarizada no trilho de alimentação ou em uma fase de clock. Durante o transitório em que o nó de saída carrega rumo a $V_{DD}$, o potencial da fonte do transistor de carga aproxima-se do potencial de porta, reduzindo a tensão porta-fonte $|V_{GS}| = |V_{G} - V_{out}|$.

Quando a saída alcança o valor crítico:

$$V_{out,max} = V_{DD} - |V_{th}|$$

o canal entra em corte pois $|V_{GS}| \le |V_{th}|$. Essa limitação provoca a perda de uma tensão de limiar inteira no nível lógico alto de saída, reduzindo as margens de ruído e tornando as transições ascendentes excessivamente lentas à medida que a corrente de dreno decai quadraticamente com a perda de overdrive.

Para contornar esse obstáculo, Faggin projetou circuitos de carga com bootstrapping capacitivo dinâmico. O circuito é composto por um transistor de amostragem e isolamento, um transistor de carga pull-up cujo terminal de porta constitui um nó dinâmico flutuante ($N_G$), e um capacitor integrado explícito ($C_B$) conectado entre o nó de saída ($V_{out}$) e o nó $N_G$.

O funcionamento ocorre em duas etapas dinâmicas:

1. Pré-carga e isolamento: Durante a fase de preparação, o transistor de isolamento conduz e carrega o nó $N_G$ a um potencial de pré-carga negativo. Ao término da fase, o transistor de isolamento entra em corte, deixando o nó $N_G$ em estado de alta impedância (flutuante).
2. Elevação capacitiva (bootstrapping): Quando o estágio de entrada comuta e o nó de saída transita bruscamente em direção a $V_{DD}$, a variação de tensão $\Delta V_{out}$ é acoplada capacitivamente ao nó flutuante $N_G$.

A elevação de potencial dinâmico no nó de porta é expressa por:

$$\Delta V_G = \left(\frac{C_B}{C_B + C_P}\right) \Delta V_{out}$$

onde $C_P$ congrega as capacitâncias parasitas associadas ao nó $N_G$ (incluindo capacitâncias de óxido de campo e a capacitância intrínseca porta-canal do transistor de carga).

Ao dimensionar o capacitor integrado de modo que $C_B \gg C_P$, obtém-se:

$$\Delta V_G \approx \Delta V_{out}$$

O potencial da porta do transistor de carga é empurrado dinamicamente além do trilho de alimentação:

$$V_G(t) \approx V_{G,inicial} + \Delta V_{out}$$

Essa sobretensão dinâmica mantém o módulo da tensão porta-fonte $|V_{GS}|$ substancialmente superior a $|V_{th}|$ durante toda a transição de subida. O transistor de carga permanece fortemente polarizado na região de condução linear (triodo), permitindo que o nó de saída atinja integralmente o potencial de alimentação ($V_{out} = V_{DD}$). A excursão lógica completa (full logic swing) restaura as margens de ruído e reduz drasticamente os tempos de subida do sinal.

### 3.3 Metodologia de Roteamento Ortogonal em Lógica Aleatória

Em matrizes de memória regulares (ROM e RAM), os transistores repetem-se em grades uniformes. No entanto, uma Unidade Central de Processamento (CPU) é constituída por blocos de lógica aleatória (random logic), como decodificadores de instrução, controle de barramento e somadores, cuja interconexão apresenta alta complexidade topológica.

Faggin instituiu para o Intel 4004 uma metodologia disciplinada de roteamento ortogonal:

1. Pistas condutoras de silício policristalino dopado foram alocadas preferencialmente ao longo de um eixo de coordenadas principal (por exemplo, na direção vertical).
2. Pistas condutoras de alumínio foram restritas ao eixo perpendicular ortogonal (na direção horizontal).
3. A interconexão entre os planos de polissilício e alumínio foi executada através de vias de contato verticais metal-polissilício, enquanto os contatos enterrados interligavam o polissilício às difusões no substrato.

Essa padronização eliminou cruzamentos complexos e percursos tortuosos de interconexão, minimizando as áreas mortas de silício e as capacitâncias distribuídas de acoplamento mútuo.

***

## 4. Arquitetura do Sistema MCS-4 e Barramento Multiplexado

### 4.1 Especificações Detalhadas dos Quatro Circuitos Integrados

A família MCS-4 (Micro Computer Set) constitui um sistema computacional completo particionado em quatro circuitos integrados em tecnologia PMOS SGT de $10\,\mu\text{m}$, todos padronizados em encapsulamentos DIP de 16 pinos:

1. Intel 4004 (Unidade Central de Processamento):
   - Função: CPU paralela monolítica de 4 bits.
   - Complexidade: Cerca de 2300 transistores PMOS em pastilha de $12\text{ mm}^2$ ($3{,}0\text{ mm} \times 4{,}0\text{ mm}$).
   - Recursos internos: ALU de 4 bits com aritmética binária e correção decimal para BCD, acumulador de 4 bits, flag de transporte (carry), banco de 16 registradores de índice de 4 bits (configuráveis como 8 pares de registradores de 8 bits para endereçamento indireto), contador de programa de 12 bits e pilha de retorno de sub-rotinas (call stack) de 3 níveis x 12 bits.
   - Repertório de instruções: 46 instruções, sendo 41 instruções de 1 palavra (8 bits) e 5 instruções de 2 palavras (16 bits).
   - Clock: Relógio bifásico com frequência nominal entre 740 kHz e 750 kHz.

2. Intel 4001 (Memória ROM e I/O):
   - Função: Memória somente de leitura com portas de entrada e saída.
   - Capacidade: 2048 bits de memória mascarada organizados como 256 palavras de 8 bits.
   - Entrada e Saída: Porta paralela embutida de 4 bits configurável na etapa de metalização.
   - Capacidade do sistema: Até 16 chips 4001 conectados ao barramento comum, perfazendo 4096 palavras de programa de 8 bits (4 Kbytes).

3. Intel 4002 (Memória RAM e I/O):
   - Função: Memória dinâmica de dados com portas de saída.
   - Capacidade: 320 bits distribuídos em 4 registradores de 20 caracteres de 4 bits (cada registrador divide-se em 16 caracteres de dados de 4 bits e 4 caracteres de estado de 4 bits para dígitos de sinal e expoentes de calculadoras).
   - Entrada e Saída: Porta paralela de saída de 4 bits.
   - Controle: Selecionada por quatro linhas de controle CM-RAM (CM-RAM0 a CM-RAM3), permitindo conectar até 16 chips 4002 no sistema, somando 5120 bits de dados.

4. Intel 4003 (Expansor de Entrada e Saída):
   - Função: Registrador de deslocamento estático de 10 bits.
   - Operação: Entrada serial, saída serial e 10 saídas paralelas independentes com operação estática sem exigir as fases de clock bifásico da CPU. Permite ligação em cascata para expansão de teclado, lâmpadas, mostradores e impressoras.

### 4.2 Protocolo de Multiplexação Temporal e Encapsulamento DIP de 16 Pinos

A restrição comercial e econômica imposta pelo encapsulamento cerâmico padrão de 16 pinos em 1971 impediu o uso de barramentos isolados para endereços, dados e controle. A Intel solucionou o problema multiplexando temporalmente todos os sinais em um barramento comum bidirecional de 4 bits (D0 a D3).

Os 16 pinos do processador Intel 4004 foram alocados da seguinte forma:
- D0, D1, D2, D3 (4 pinos): Barramento bidirecional de dados, endereços e instruções.
- $\phi_1, \phi_2$ (2 pinos): Entradas de clock bifásico não sobreposto.
- SYNC (1 pino): Saída de sincronização indicando o início de cada ciclo de instrução.
- RESET (1 pino): Entrada de reinicialização para inicialização dos registradores e PC.
- TEST (1 pino): Entrada de teste para instruções condicionais de salto (JCN).
- CM-RAM0, CM-RAM1, CM-RAM2, CM-RAM3 (4 pinos): Linhas de habilitação e seleção de bancos de memória RAM 4002.
- CM-ROM (1 pino): Linha de controle para seleção de bancos de ROM 4001.
- $V_{SS}, V_{DD}$ (2 pinos): Terminais de alimentação elétrica ($V_{SS} = +5\text{ V}$, $V_{DD} = -10\text{ V}$).

Total: 16 pinos rigorosamente preenchidos.

### 4.3 Fases do Ciclo de Instrução sob Relógio Bifásico

O ciclo de relógio bifásico emprega duas fases não sobrepostas, $\phi_1$ e $\phi_2$. Com o período mínimo de clock especificado em $1{,}35\,\mu\text{s}$ (frequência de $740{,}7\text{ kHz}$), a execução de uma instrução de 1 palavra necessita de 8 períodos de relógio consecutivos, determinando um ciclo de instrução de $10{,}8\,\mu\text{s}$ e uma vazão de 92.600 instruções por segundo.

O ciclo de instrução básico reparte-se cronologicamente em oito subciclos de temporização:

1. Subciclo A1 (Address 1): A CPU coloca no barramento de 4 bits os quatro bits menos significativos do endereço de ROM ($A_0 - A_3$).
2. Subciclo A2 (Address 2): A CPU coloca no barramento os quatro bits intermediários do endereço de ROM ($A_4 - A_7$).
3. Subciclo A3 (Address 3): A CPU coloca no barramento os quatro bits mais significativos do endereço de ROM ($A_8 - A_{11}$), completando o endereço de 12 bits para a seleção de uma entre 4096 palavras na ROM.
4. Subciclo M1 (Memory 1): O chip de ROM 4001 selecionado decodifica o endereço internamente e devolve no barramento os quatro bits superiores da palavra de instrução, denominados OPR (código da operação).
5. Subciclo M2 (Memory 2): A ROM coloca no barramento os quatro bits inferiores da palavra de instrução, denominados OPA (modificador da operação). A CPU armazena o byte de instrução completo de 8 bits em seu registrador de instruções interno.
6. Subciclo X1 (Execute 1): A CPU decodifica o código da instrução e inicia a execução lógica ou aritmética na ALU e manipulação de registradores de índice.
7. Subciclo X2 (Execute 2): A CPU conclui as operações na ALU, atualiza os registradores internos e seta as flags de status (carry e acumulador).
8. Subciclo B (Bus / Data / I/O): Ocorre a transferência de dados de 4 bits entre a CPU e os periféricos ou chips de RAM 4002 (leitura ou escrita de caracteres de memória e portas de I/O).

Em instruções de 2 palavras (16 bits), o ciclo de oito fases é repetido sequencialmente, totalizando 16 períodos de clock ($21{,}6\,\mu\text{s}$).

***

## 5. Especificação Técnica de Diagramas e Figuras Recomendadas

### 5.1 Figura 1: Corte Transversal Comparativo entre Porta de Alumínio e Porta de Silício (SGT)

- Legenda Técnica Recomendada:
  Comparação esquemática em corte transversal entre o transistor MOS convencional com porta de alumínio e o transistor com porta de silício autoalinhada (SGT). Em (a), destaca-se a sobreposição geométrica deliberada necessária para compensar tolerâncias fotolitográficas e a utilização de túneis difusos resistivos no substrato. Em (b), observa-se o alinhamento intrínseco de fonte e dreno ditado pela máscara de polissilício, a eliminação da sobreposição mecânica, a integração de contatos enterrados diretos e a disponibilidade de duas camadas condutoras de interconexão sobrepostas.
- Rótulo LaTeX sugerido: `fig:sgt_vs_metalgate`
- Arquivo proposto no diretório img/: `img/sgt_vs_metalgate.pdf`
- Dimensões recomendadas no documento: `width=0.90\columnwidth`

### 5.2 Figura 2: Arquitetura de Barramento e Temporização do Sistema MCS-4

- Legenda Técnica Recomendada:
  Arquitetura de barramento compartilhado e cronograma temporal de multiplexação do sistema Intel MCS-4. Os quatro circuitos integrados (4004, 4001, 4002 e 4003) conectam-se por um barramento comum de dados e controle em encapsulamento DIP de 16 pinos. O ciclo de instrução de 10,8 microsegundos reparte-se em oito subciclos de relógio bifásico (A1, A2, A3, M1, M2, X1, X2 e B) para transferir sequencialmente endereços de 12 bits, instruções de 8 bits e dados de 4 bits.
- Rótulo LaTeX sugerido: `fig:mcs4_bus_timing`
- Arquivo proposto no diretório img/: `img/mcs4_bus_timing.pdf`
- Dimensões recomendadas no documento: `width=\columnwidth`
