# Relatório Técnico de Pesquisa e Historiografia para a Seção V: Discussão

Este documento consolida os subsídios físicos, microarquiteturais, econômicos e historiográficos para a redação da Seção V (Discussão) do artigo sobre Federico Faggin e o Intel 4004.

---

## 1. Interdependência entre Física de Dispositivos e Arquitetura de Computadores

### 1.1 Superação da Dicotomia entre Formulação Lógica e Implementação Física
No final da década de 1960, a ciência da computação e a engenharia de semicondutores operavam como domínios apartados. A concepção de sistemas computacionais concentrava-se na lógica booleana formal, em diagramas de blocos e em modelos conceituais de registradores e barramentos, enquanto a microeletrônica de estado sólido tratava de difusão térmica, defeitos de rede cristalina e física de superfícies.

O projeto do Intel 4004 superou essa separação ao evidenciar que uma arquitetura de processador de uso geral é rigorosamente condicionada pelas características materiais do silício. A integração da Unidade Central de Processamento em uma pastilha única não constituía apenas um problema lógico ou de repertório de instruções, mas sim uma equação de viabilidade física regida por capacitâncias parasitas, densidade de interconexão e dissipação térmica.

### 1.2 Inexequibilidade Prática da Proposta de Hoff e Mazor sob Porta Metálica Convencional
A contraproposta concebida por Marcian Hoff e Stanley Mazor para a calculadora Busicom em 1969 substituiu doze circuitos integrados de lógica fixa por quatro componentes programáveis (a família MCS-4). Contudo, essa especificação permaneceu como formulação abstrata de alto nível e simulação funcional por mais de seis meses, sem que a engenharia da Intel conseguisse convertê-la em leiaute físico viável.

A implementação dessa arquitetura sob a tecnologia convencional PMOS de porta metálica de alumínio era inviável por três razões físicas:
1. Capacitância Parasita de Sobreposição e Atraso de Propagação: As etapas manuais de fotolitografia exigiam uma sobreposição de 3 a 5 micrometros da porta metálica sobre fonte e dreno ($\Delta L_{align}$). Essa sobreposição inflava a capacitância geométrica ($C_{ov} = C_{ox} W L_{ov}$), a qual era amplificada pelo efeito Miller dinâmico em portas inversoras ($C_{in,Miller} \approx (4 \text{ a } 6) \times C_{gd}$). O produto RC resultante restringia a frequência máxima a menos de 150 kHz, tornando impossível atingir o ciclo de instrução de 10,8 microssegundos necessário para o controle da calculadora.
2. Congestionamento de Interconexão e Túneis Difusos: O processo de porta de alumínio oferecia apenas uma camada condutora utilizável (o metal). Em blocos de lógica aleatória complexa (decodificadores, somadores e unidades de controle), o cruzamento de sinais exigia túneis difusos no substrato, com alta resistência de folha (30 a 100 ohms por quadrado) e elevadas capacitâncias de junção, gerando atrasos inaceitáveis e consumindo área excessiva de pastilha.
3. Área Excessiva e Inviabilidade de Rendimento Litográfico: A contagem lógica de cerca de 2300 transistores demandaria uma área de pastilha superior a 20 a 24 milímetros quadrados sob porta de alumínio. Nas lâminas de 2 polegadas de 1970, com as densidades de defeitos vigentes, o rendimento de fabricação (yield) seria virtualmente nulo, inviabilizando o produto economicamente.

### 1.3 O Papel Integrador de Federico Faggin
Ao assumir a liderança técnica do projeto MCS-4 em abril de 1970, Federico Faggin viabilizou a síntese entre a abstração lógica e a física do estado sólido:
- A Tecnologia de Porta de Silício (SGT) autoalinhada eliminou a tolerância litográfica ($\Delta L_{align} = 0$), reduzindo a sobreposição à difusão lateral e cortando a capacitância de borda em até 80%, viabilizando o relógio a 740 kHz.
- O contato enterrado (buried contact) permitiu conectar diretamente a camada condutora de polissilício às difusões do substrato sem vias verticais para o alumínio, reduzindo a área de células de lógica aleatória em 50% e fechando o circuito em 12 milímetros quadrados.
- As cargas ativas com bootstrapping dinâmico garantiram excursão lógica plena ($V_{out} = V_{DD}$) sem atenuação de limiar, assegurando margens de ruído elevadas.
- O roteamento ortogonal em duas camadas (polissilício e alumínio) disciplinou a distribuição física das linhas de dados e de controle em lógica aleatória não regular.

---

## 2. Reorganização Econômica da Indústria de Semicondutores

### 2.1 Ruptura do Modelo de Circuitos Sob Medida (Custom ASIC)
Antes do 4004, a indústria operava sob a dualidade entre componentes padronizados de baixa integração (portas e flip-flops TTL) e circuitos complexos desenvolvidos sob encomenda exclusiva para um único cliente. O modelo customizado impunha elevados custos de engenharia não recorrente (NRE) e longos prazos de entrega.

O microprocessador rompeu esse modelo ao instituir o componente programável de uso geral como produto comercial de catálogo (standard part). A diferenciação de produtos foi transferida do leiaute físico do silício para o firmware gravado em memórias de programa (ROM 4001 e EPROMs).

### 2.2 Economias de Escala e Amortização de Custos de P&D
A padronização permitiu produzir pastilhas idênticas em grandes volumes nas mesmas linhas de fabricação. Isso gerou rápida subida na curva de aprendizado litográfico, redução expressiva do custo unitário do componente e diluição dos altos custos de pesquisa e desenvolvimento entre milhares de clientes e setores diversos.

### 2.3 Desverticalização e Emergência da Indústria de Software
A dissociação entre a função do produto e a topologia física do chip permitiu a desverticalização da cadeia eletrônica. Empresas de produtos finais puderam criar equipamentos avançados sem manter fundições de semicondutores. O valor agregado deslocou-se progressivamente para a camada de algoritmos e programação, originando a indústria independente de software, compiladores, montadores e ferramentas de desenvolvimento de sistemas embarcados.

---

## 3. Limitações Físicas do PMOS e a Transição para NMOS e CMOS

### 3.1 Restrições Intrínsecas da Tecnologia PMOS SGT
Apesar do êxito do Intel 4004, o processo PMOS apresentava limites físicos:
- Assimetria de Mobilidade de Portadores: A mobilidade de lacunas ($\mu_p \approx \SIrange{150}{200}{\centi\meter\squared\per\volt\per\second}$) é quase três vezes inferior à dos elétrons ($\mu_n \approx \SIrange{500}{800}{\centi\meter\squared\per\volt\per\second}$), exigindo canais mais largos ($W$) para atingir a mesma corrente $I_{on}$, o que inflava a capacitância intrínseca de porta.
- Dissipação de Potência Estática: A lógica unipolar com transistores de carga ativos gerava correntes contínuas no estado baixo, limitando a contagem de transistores antes de atingir limites térmicos do encapsulamento cerâmico.
- Tensões Assimétricas: Exigência de fontes duplas (+5 V e -10 V), demandando fontes de alimentação mais complexas nos circuitos impressos.

### 3.2 Transição para NMOS SGT de 6 micrometros (Intel 8080)
Conduzida por Faggin e Shima na Intel, a transição para NMOS SGT com litografia de 6 micrometros culminou no lançamento do Intel 8080 em 1974:
- Aproveitamento da maior mobilidade dos elétrons, triplicando a transcondutância por área e permitindo frequência de 2 MHz.
- Integração de até 6000 transistores com barramento de dados de 8 bits, endereçamento de 64 KB e ponteiro de pilha na memória RAM.
- Operação com níveis lógicos compatíveis diretamente com TTL e alimentação simplificada, viabilizando os primeiros microcomputadores pessoais (Altair 8800).

### 3.3 Lógica Complementar CMOS e o Escalamento de Dennard
A sustentação da Lei de Moore em larga escala exigiu a transição para a lógica complementar CMOS (Mead e Conway 1980, Weste e Harris 2011). No CMOS, a condução ocorre apenas durante as transições de chaveamento, anulando a dissipação estática em repouso.

A base teórica dessa escalabilidade foi formalizada por Robert Dennard et al. (1974) no IBM Research. O Escalamento de Dennard demonstrou que, ao reduzir as dimensões geométricas ($L$, $W$, $t_{ox}$) e a tensão de alimentação ($V_{DD}$) por um fator constante $\kappa$, a densidade de transistores aumenta por $\kappa^2$, a frequência cresce por $\kappa$ e a densidade de potência dissipada permanece rigorosamente constante.

---

## 4. Confronto Historiográfico com Projetos Paralelos e Limitações do Estudo

### 4.1 Texas Instruments TMS 1000
- Autores: Gary Boone e Michael Cochran (patentes US 3.757.306 e US 4.074.351).
- Caracterização: Circuito integrado PMOS de porta metálica que agrupava CPU de 4 bits, memória ROM de 1 KB, memória RAM estática de 256 bits e portas de E/S na mesma pastilha.
- Distinção: Considerado historicamente como o primeiro microcontrolador em pastilha única (computer on a chip) para controle dedicado de baixo custo com programa fixo. Utilizado internamente a partir de 1972 em calculadoras da TI e lançado no mercado geral em 1974. O Intel 4004, por contraste, foi concebido como uma Unidade Central de Processamento (microprocessador) modular, expansível em barramento externo multiplexado.

### 4.2 Four-Phase Systems AL1
- Autor: Lee Boysel (1969-1970).
- Caracterização: Circuito LSI de 8 bits em tecnologia MOS de porta de alumínio e lógica de quatro fases, contendo registradores de dados e Unidade Lógica e Aritmética (ALU).
- Distinção: O AL1 não era uma CPU completa autônoma, mas uma fatia de processador (bit-slice). No minicomputador System IV/70, a CPU de 24 bits utilizava três chips AL1 combinados com múltiplos circuitos de controle, geradores de relógio e memórias de microcódigo em chips externos.

### 4.3 Garrett AiResearch Central Air Data Computer (CADC) MP944
- Autores: Ray Holt e Steve Geller (1968-1970), para o caça naval Grumman F-14 Tomcat. Relatório técnico desclassificado militarmente em 1998.
- Caracterização: Computador de dados aéreos baseado em um conjunto de seis chips LSI especializados de 20 bits (AMI PMOS), dedicado ao cálculo aerodinâmico de voo em tempo real.
- Distinção: O CADC MP944 era um chipset multichip especializado e não uma CPU monolítica de uso geral. Permaneceu sob sigilo militar e fora do ecossistema comercial civil de microprocessadores. Nota técnica: o código correto do chipset é MP944 (não MP984).

### 4.4 Limitações Metodológicas do Estudo
1. Recorte Temático: O trabalho focaliza a linhagem Faggin (Fairchild, Intel e Zilog) e a arquitetura MOS, não aprofundando o papel das famílias lógicas bipolares de alta velocidade (ECL e TTL Schottky) que atendiam aos minicomputadores de alto desempenho da mesma época.
2. Modelagem Contrafactual: As comparações de desempenho e área entre SGT e porta metálica apoiam-se em modelos analíticos de primeira ordem e regras de escalamento geométrico, constituindo deduções analíticas fundamentadas e não ensaios de bancada em protótipos físicos inexistentes do 4004 em porta de alumínio.
