# Federico Faggin, a Revolução dos Microprocessadores e seus Impactos Sociais

## Escopo e tese central

A evidência primária sustenta uma divisão de autoria tecnicamente precisa: Marcian “Ted” Hoff concebeu a simplificação arquitetural inicial; Stanley Mazor ajudou a fechar arquitetura, conjunto de instruções e solução por interpretador; Masatoshi Shima trouxe os requisitos, refinou instruções, realizou o projeto lógico detalhado do 4004 e a simulação lógica; Federico Faggin liderou a execução do MCS-4 e respondeu pelo projeto de circuitos, metodologia de lógica aleatória em porta de silício, layout, integração física, depuração e transferência para fabricação. O 4004 não foi, portanto, uma “ideia solitária”, mas a passagem de uma arquitetura programável para silício manufaturável dependeu decisivamente do trabalho de Faggin.[^1][^2][^3]

Duas correções historiográficas são indispensáveis. A patente US 3,475,234 não é uma patente Fairchild de 1968: foi depositada em 27 de março de 1967 por Robert E. Kerwin, Donald L. Klein e John C. Sarace, atribuída à Bell Telephone Laboratories e concedida em 28 de outubro de 1969. Além disso, o artigo “Silicon Gate Technology” foi escrito por Federico Faggin e Thomas Klein, enquanto o “Klein” da patente básica da Bell Labs é Donald L. Klein; são pessoas e documentos distintos.[^4][^5][^6][^7]

***

## Eixo 1 — Contexto histórico e problema técnico

### Síntese técnica objetiva

#### Da tirania dos números ao SSI/MSI

A expressão “tirania dos números”, associada a Jack Morton, descrevia a situação em que sistemas digitais úteis exigiam centenas, milhares ou dezenas de milhares de dispositivos e um número explosivo de conexões. O custo, o volume, a dissipação, a montagem manual e a probabilidade de falha das interconexões passaram a limitar mais o sistema do que a possibilidade lógica de projetá-lo.[^8][^9][^10]

Os circuitos integrados monolíticos e o processo planar reduzirziam as conexões entre componentes discretos, mas o problema reaparecia no nível de sistema ao construir funções complexas com muitos encapsulamentos SSI/MSI. Cada encapsulamento acrescentava pinos, trilhas de placa, carga capacitiva, atraso, potência, pontos de falha e custo de montagem; assim, a integração funcional e a relação lógica/pino tornaram-se parâmetros de arquitetura, não apenas de fabricação.[^11][^12][^3]

No caso Busicom, Hoff observou que a extensa interconexão entre chips exigiria encapsulamentos grandes e caros e poderia, por si só, inviabilizar a meta de custo. A resposta arquitetural foi substituir vários blocos de lógica fixa por uma CPU simples, memória de programa e memória de dados, reutilizando o mesmo hardware mediante firmware.[^3][^1]

#### Gênese Busicom, 1969–1970

Em abril de 1969, a Busicom/Nippon Calculating Machine contratou a Intel para desenvolver uma família de circuitos para calculadoras e máquinas comerciais; a narrativa corporativa posterior consolidou a demanda como um conjunto de doze chips customizados. O artigo conjunto dos quatro protagonistas registra uma proposta Busicom de computador decimal macroprogramável em ROM, particionada em sete tipos de LSI — controle de programa, unidade aritmética decimal, temporização, ROM, registrador de deslocamento, controle da impressora e portas de saída — enquanto os depoimentos variam entre oito, nove, dez e doze peças conforme se contam “tipos” de chip ou instâncias da família.[^13][^14][^2][^1][^3]

Essa divergência deve ser explicitada no artigo científico: “12 chips” é a forma consagrada para o conjunto inicial, mas a fonte primária de 1996 descreve sete tipos funcionais. Não há contradição necessária se forem distinguidos tipos de LSI, chips efetivamente previstos por configuração e evolução da proposta durante 1969.[^2][^3]

Hoff estudou em julho e agosto de 1969 uma máquina binária de 4 bits, adequada à aritmética BCD, com instruções primitivas e sub-rotinas em lugar de macroinstruções complexas. Mazor, incorporado em setembro, ajudou a refinar a proposta, sugeriu a busca indireta e escreveu um interpretador de cerca de 19–20 bytes que reproduzia operações da máquina Busicom em firmware; Shima testou programas de aplicação e propôs alterações para teclado, teste externo, desvios, retorno de sub-rotina e controle em tempo real.[^1][^3]

A administração da Busicom aceitou a abordagem Intel em outubro de 1969. A especificação, porém, não era ainda um projeto de chip: Hoff e Mazor não eram projetistas MOS e a equipe de projeto da Intel estava comprometida com memórias, deixando o trabalho sem implementação física por aproximadamente seis meses.[^3][^1]

#### A lacuna de implementação

A arquitetura Hoff–Mazor era logicamente plausível, mas não estava convertida em lógica detalhada, circuitos temporizados, regras de layout, máscaras, teste ou produto manufaturável. Portanto, “inexequível” deve ser entendido como inexequível **econômica e fisicamente nas condições de 1969–1970**, não como uma arquitetura formalmente impossível.[^1][^3]

Com porta metálica PMOS convencional, uma CPU de lógica aleatória dessa complexidade tenderia a exceder a área economicamente aceitável ou a meta de velocidade/potência. A SGT prometia de três a cinco vezes a velocidade e aproximadamente metade da área, mas ainda faltavam uma metodologia de lógica aleatória, cargas bootstrap compatíveis com SGT, contatos enterrados, circuitos de reset, disciplina de temporização bifásica e layout capaz de fechar o retângulo de 3 mm por 4 mm.[^15][^16][^1]

Faggin ingressou na Intel em 3 de abril de 1970 e encontrou quatro chips atrasados, um cliente esperando esquemas e nenhuma metodologia interna para lógica aleatória complexa em SGT. Ele estabeleceu o fluxo conjunto de lógica–circuito–layout, projetou os circuitos, supervisionou as máscaras e o projeto físico, e usou o contato enterrado e a carga bootstrap para atingir densidade, excursão lógica e velocidade.[^3][^1]

A atribuição fina, sustentada pelo artigo conjunto, é: Shima realizou o projeto lógico detalhado do 4004 e a simulação durante junho–julho de 1970; Faggin concentrou-se em projeto de circuito, layout e supervisão integral. Os primeiros 4004 falharam porque a camada de contato enterrado foi omitida no processamento; uma nova rodada funcionou em janeiro de 1971, e a revisão plenamente funcional ficou pronta em março.[^1][^3]

### Fontes primárias e trechos-chave

| Documento | Natureza | Evidência principal | Trecho-chave curto |
|---|---|---|---|
| Faggin, Hoff, Mazor e Shima, “The History of the 4004”, 1996 | Artigo memorial conjunto, IEEE Micro | Cronologia, divisão do trabalho, dimensões, bootstrap, buried contact e depuração | “logic design, circuit design, layout design”[^3] |
| Hoff e Mazor, entrevista CHM, 2006 | História oral | Hoff reformulou cerca de doze lógicas customizadas; Mazor estruturou a arquitetura de CPU de 4 bits | “more flexible general purpose solution”[^2] |
| Painel CHM do 4004, 2007 | História oral dos cinco participantes | Datas, desacordos, papel de aplicação de Shima e chegada de Faggin | “I joined Intel in April the 3rd, 1970”[^1] |
| Intel, MCS-4 Data Sheet, novembro de 1971 | Folha de dados contemporânea | Caracterização do conjunto como sistema programável e dados elétricos | “Micro Computer Set”[^17] |
| Intel, anúncio de 15 de novembro de 1971 | Documento comercial contemporâneo | Lançamento público da família programável | “new era in integrated electronics”[^3] |

### Quadro histórico-técnico

| Data | Evento | Resultado técnico | Responsabilidade principal |
|---|---|---|---|
| Abril de 1969 | Acordo provisório Intel–Busicom | Transferência de uma família LSI para calculadoras/máquinas comerciais | Busicom e Intel[^1] |
| Junho de 1969 | Equipe Busicom chega à Intel | Arquitetura decimal e esquemas iniciais apresentados | Shima, Masuda e Takayama[^1] |
| Julho–agosto de 1969 | Alternativa de CPU geral | CPU binária de 4 bits, RAM aleatória e ROM de programa | Hoff[^3] |
| Setembro–dezembro de 1969 | Fechamento conceitual | Interpretador, busca indireta, teste, teclado, I/O e ISA refinada | Hoff, Mazor e Shima[^3][^1] |
| Outubro de 1969 | Busicom aceita a alternativa | Compromisso com CPU em chip único e família de quatro tipos | Administrações Intel/Busicom[^3] |
| 3 de abril de 1970 | Faggin entra na Intel | Início efetivo da implementação de silício | Faggin[^1] |
| Junho–julho de 1970 | Lógica detalhada do 4004 | Esquemas lógicos e simulação | Shima; supervisão e circuitos por Faggin[^3] |
| Outubro–novembro de 1970 | Primeiros 4001/4002/4003 | 4001 e 4003 funcionais; correção menor no 4002 | Faggin e Shima[^3] |
| Dezembro de 1970 | Primeiro wafer 4004 | Falha por máscara de buried contact omitida | Falha de processamento identificada por Faggin[^3] |
| Janeiro–março de 1971 | Novo silício e correções | CPU funcional; revisão completa em março | Faggin[^3] |
| 15 de novembro de 1971 | Lançamento MCS-4 | Disponibilização pública do microprocessador | Intel[^14] |

### Registros BibTeX do Eixo 1

```bibtex
@article{faggin1996history4004,
  author  = {Faggin, Federico and Hoff, Marcian E., Jr. and Mazor, Stanley and Shima, Masatoshi},
  title   = {The History of the 4004},
  journal = {IEEE Micro},
  volume  = {16},
  number  = {6},
  pages   = {10--20},
  year    = {1996},
  month   = dec,
  doi     = {10.1109/40.546561}
}

@misc{chm4004panel2007,
  author       = {Faggin, Federico and Feeney, Hal and Hoff, Ted and Mazor, Stan and Shima, Masatoshi},
  title        = {Oral History Panel on the Development and Promotion of the Intel 4004 Microprocessor},
  howpublished = {Computer History Museum, CHM Reference X4024.2007},
  year         = {2007},
  month        = apr,
  url          = {https://archive.computerhistory.org/resources/access/text/2012/04/102658187-05-01-acc.pdf},
  urldate      = {2026-10-10}
}

@misc{chmhoffmazor2006,
  author       = {Hoff, Ted and Mazor, Stan},
  title        = {Intel 4004 Microprocessor: Oral History Panel with Ted M. Hoff and Stan Mazor},
  howpublished = {Computer History Museum, Catalog 102657974},
  year         = {2006},
  month        = sep,
  url          = {https://www.computerhistory.org/collections/catalog/102657974},
  urldate      = {2026-10-10}
}

@manual{intel1971mcs4datasheet,
  organization = {Intel Corporation},
  title        = {MCS-4 Micro Computer Set Data Sheet},
  year         = {1971},
  month        = nov,
  number       = {7144},
  url          = {https://archive.org/details/bitsavers_intelMCS4M_11184923},
  urldate      = {2026-10-10}
}
```

***

## Eixo 2 — Física de semicondutores e engenharia de dispositivos

### Síntese técnica objetiva

#### Genealogia correta da porta autoalinhada

A patente básica US 3,475,234, “Method for Making MIS Structures”, pertence à Bell Telephone Laboratories e tem Robert E. Kerwin, Donald L. Klein e John C. Sarace como inventores. Suas nove reivindicações cobrem o método de formar estruturas MIS em que o eletrodo refratário participa da definição posterior das regiões do dispositivo, estabelecendo o fundamento da porta autoalinhada.[^7][^4]

Na Fairchild, Faggin liderou a transformação desse princípio em um processo comercial de CI: arquitetura de processo confiável, deposição de silício policristalino, gettering de fósforo, contato enterrado e demonstração no Fairchild 3708. O artigo técnico de referência é “Silicon Gate Technology”, de Federico Faggin e Thomas Klein, publicado em *Solid-State Electronics*, volume 13, páginas 1125–1144, em 1970, DOI 10.1016/0038-1101(70)90124-3.[^5][^18][^6]

A separação conceitual é, portanto: Bell Labs patenteou o processo básico de porta autoalinhada; Faggin e Thomas Klein/Fairchild o tornaram uma tecnologia comercial de circuitos integrados de alta densidade e velocidade; Faggin posteriormente completou a metodologia de lógica aleatória necessária ao MCS-4.[^18][^16][^19]

#### Porta de alumínio versus polissilício

No processo PMOS de porta metálica, fonte e dreno eram difundidos antes da deposição e definição da porta de alumínio. Como a máscara de metal precisava tolerar erro de alinhamento em relação às junções, o desenho impunha uma sobreposição nominal positiva, aumentando as capacitâncias porta–fonte e porta–dreno.[^20][^21]

Na SGT, o polissilício fortemente dopado é refratário e pode ser definido antes da difusão/implantação das regiões de fonte e dreno. A própria porta funciona como máscara: o erro litográfico desloca dimensões externas de fonte/dreno, mas não cria a grande sobreposição sistemática da porta metálica; permanece apenas a sobreposição residual por difusão lateral e campos de borda.[^20][^7]

Para uma borda de sobreposição, a aproximação de primeira ordem é

\[
C_{ov}=C_{ox}WL_{ov}, \qquad C_{ox}=\frac{\varepsilon_{ox}}{t_{ox}}.
\]

Se fonte e dreno forem contabilizados, a parcela geométrica total é aproximadamente \(C_{ov,tot}=C_{ox}W(L_{ov,s}+L_{ov,d})\). Na transição inversora, a parcela porta–dreno é multiplicada pelo efeito Miller: \(C_{in,gd}\approx C_{gd}(1-A_v)\); por isso, reduzir \(L_{ov}\) afeta o atraso mais do que a capacitância geométrica isolada sugeriria.

O autoalinhamento não torna \(C_{ov}\) matematicamente zero: elimina a margem de sobreposição imposta pela tolerância entre máscaras, restando difusão lateral, fringing e capacitâncias intrínsecas do canal. A formulação correta para o artigo é “eliminação da sobreposição litográfica deliberada”, não “eliminação absoluta de toda capacitância de overlap”.[^20]

#### Tensão de limiar e função-trabalho

Em notação geral MOS,

\[
V_{FB}=\Phi_{ms}-\frac{Q_{ox}}{C_{ox}},
\]

\[
V_{th}=V_{FB}+2\phi_F+\frac{\sqrt{4q\varepsilon_sN\phi_F}}{C_{ox}}
\]

para a convenção nMOS; em pMOS, os sinais se invertem conforme o substrato e a referência adotados. O ponto físico permanece: alterar \(\Phi_{ms}\) desloca diretamente \(V_{FB}\) e, portanto, \(V_{th}\).

Para PMOS, a diferença de função-trabalho entre polissilício tipo p fortemente dopado e substrato tipo n era cerca de 1,1 V menor que entre alumínio e o mesmo substrato. Isso reduziu em aproximadamente 1,1 V a magnitude da tensão de limiar, permitindo menor tensão efetiva, transições mais rápidas e melhor margem de interface.[^21][^22]

A estabilidade não veio somente de \(\Phi_{ms}\): a porta de silício suportava tratamentos térmicos/gettering após o fechamento da estrutura, reduzindo impurezas, fuga de junção e deriva de limiar. A SGT comercial reportou redução de fuga superior a duas ordens de magnitude em relação ao processo metálico comparado.[^16][^23]

A patente US 3,673,471, “Doped Semiconductor Electrodes for MOS Type Devices”, de Thomas Klein e Federico Faggin, torna explícita a relação: a tensão necessária à inversão pode ser deslocada e seletivamente controlada pela dopagem do eletrodo semicondutor.[^22]

#### Segunda camada e lógica aleatória

O polissilício não funcionava apenas como porta; atuava como camada condutora local. O contato enterrado conectava diretamente uma linha de polisilício a uma difusão, sem ponte de alumínio, permitindo cruzamentos e roteamento em duas camadas efetivas.[^24][^15]

Uma estratégia típica era reservar metal e polissilício para direções preferenciais aproximadamente ortogonais. Isso reduzia detours, contatos metal–difusão e área de roteamento, efeito particularmente importante em lógica aleatória, cuja topologia não apresenta a regularidade de matrizes ROM/RAM.[^24][^20]

#### Família MCS-4

O conjunto combinava quatro tipos de CI sobre um barramento multiplexado de 4 bits. O 4001 armazenava 256 palavras de 8 bits e incluía porta de I/O de 4 bits; o 4002 fornecia 320 bits de RAM organizados em quatro registradores de vinte caracteres de 4 bits e uma saída de 4 bits; o 4003 era um registrador estático de deslocamento de 10 bits para expansão de I/O; o 4004 era a CPU paralela de 4 bits.[^25][^26][^27]

O 4004 podia endereçar diretamente 4K palavras de instrução de 8 bits e 5.120 bits de RAM, continha 16 registradores de índice de 4 bits, 46 instruções e interface para até 16 portas de entrada e 16 de saída de 4 bits.[^28]

O processo era PMOS de porta de silício, dimensão mínima de 10 micrômetros, em wafer de 2 polegadas; o die media 12 mm², aproximadamente 3 mm por 4 mm, e continha cerca de 2.300 transistores. O encapsulamento comercial inicial era DIP cerâmico de 16 pinos; a tensão principal era definida no datasheet como \(V_{SS}-V_{DD}=15\text{ V}\), de modo que, com \(V_{SS}=0\text{ V}\), \(V_{DD}\approx-15\text{ V}\).[^29][^30][^31][^28]

### Fontes primárias e trechos-chave

| Documento | Identificação exata | Conteúdo técnico | Trecho-chave curto |
|---|---|---|---|
| US 3,475,234 | Kerwin, R. E.; Klein, D. L.; Sarace, J. C.; depósito 1967, concessão 1969 | Método básico de estruturas MIS com porta autoalinhada | “Method for Making MIS Structures”[^7] |
| “Silicon Gate Technology” | Faggin, F.; Klein, T.; 1970; *Solid-State Electronics* 13, 1125–1144 | Processo SGT comercial, física, fabricação e desempenho | “Silicon Gate Technology”[^6] |
| US 3,673,471 | Klein, T.; Faggin, F.; depósito 1970, concessão 1972 | Controle de \(V_{th}\) por eletrodo semicondutor dopado | “threshold voltage ... selectively controlled”[^22] |
| Intel 4004 Data Sheet | Intel Corporation | PMOS, 46 instruções, ciclo, alimentação e temporização | “complete 4-bit parallel CPU”[^28] |
| MCS-4 Users Manual | Intel Corporation, 1973/1974 | Organização funcional, pinagem, sinais e expansão | “4 BIT CENTRAL PROCESSOR UNIT”[^32] |

### Quadro dos dispositivos MCS-4

| CI | Função | Organização/capacidade | I/O | Interação no sistema |
|---|---|---|---|---|
| 4001 | ROM de programa | 256 × 8 bits = 2.048 bits | Porta de 4 bits | Recebe endereço multiplexado; entrega instruções/dados de ROM; até 16 por banco de programa[^25][^26] |
| 4002 | RAM de dados | 4 × 20 × 4 bits = 320 bits; mais caracteres de status | Saída de 4 bits | Seleção por CM-RAM; leitura/escrita via barramento; até 16 por banco[^25][^26] |
| 4003 | Expansor de I/O | Shift register estático de 10 bits | Serial in; serial/parallel out | Converte fluxo serial em até 10 linhas paralelas; cascateável[^25][^27] |
| 4004 | CPU | 4 bits; 16 registradores × 4 bits; PC/stack de endereços de 12 bits; 46 instruções | Barramento bidirecional de 4 bits, SYNC, TEST e comandos de memória | Multiplexa endereço, instrução e dados nos mesmos quatro fios[^32][^28] |

### Quadro físico do 4004

| Parâmetro | Valor | Observação metrológica |
|---|---:|---|
| Tecnologia | PMOS silicon-gate | Não CMOS[^28] |
| Dimensão mínima | 10 µm | Largura mínima de linha divulgada pelo CHM[^30] |
| Área do die | 12 mm² | Aproximadamente 3 mm × 4 mm[^29][^30] |
| Transistores | ≈2.300 | Depoimento de Shima cita 2.238 na contagem de projeto; 2.300 é o número histórico arredondado[^1][^29] |
| Densidade bruta | ≈191,7 transistores/mm² | Cálculo: 2.300/12; inclui áreas não ativas e pads |
| Alimentação | \(V_{SS}-V_{DD}=15\text{ V}\pm5\%\) | Com \(V_{SS}=0\), \(V_{DD}=-15\text{ V}\)[^28] |
| Encapsulamento | DIP cerâmico, 16 pinos | Família projetada para poucos pinos e barramento multiplexado[^31] |
| Wafer | 2 polegadas | PMOS de porta de silício[^30] |

### Comparação física das portas

| Aspecto | PMOS porta de alumínio | PMOS SGT de polissilício |
|---|---|---|
| Ordem de fabricação | Junções antes da porta | Porta refratária antes da dopagem de fonte/dreno |
| Alinhamento | Máscaras independentes; requer margem \(L_{ov}\) | Porta mascara a dopagem; autoalinhamento |
| Capacitância | \(C_{ov}=C_{ox}WL_{ov}\) com margem litográfica | Sem margem deliberada; resta difusão lateral/fringing |
| Função-trabalho | \(\Phi_{ms}\) alumínio–substrato | \(\Phi_{ms}\) ajustável pela dopagem do poly |
| \(V_{th}\) PMOS | Maior magnitude no processo comparado | Cerca de 1,1 V menor no caso documentado[^21] |
| Interconexão | Uma camada principal de alumínio | Poly local + alumínio; buried contacts |
| Lógica aleatória | Mais pontes, área e parasitas | Roteamento mais denso e regularizável |
| Tratamento térmico final | Limitado pela metalização | Porta refratária suporta etapas térmicas/gettering |

### Registros BibTeX do Eixo 2

```bibtex
@article{faggin1970silicongate,
  author  = {Faggin, Federico and Klein, Thomas},
  title   = {Silicon Gate Technology},
  journal = {Solid-State Electronics},
  volume  = {13},
  pages   = {1125--1144},
  year    = {1970},
  month   = aug,
  doi     = {10.1016/0038-1101(70)90124-3}
}

@patent{kerwin1969mis,
  author      = {Kerwin, Robert E. and Klein, Donald L. and Sarace, John C.},
  title       = {Method for Making MIS Structures},
  number      = {US 3,475,234},
  holder      = {Bell Telephone Laboratories, Incorporated},
  year        = {1969},
  filing_date = {1967-03-27},
  issue_date  = {1969-10-28},
  url         = {https://patents.google.com/patent/US3475234A/en}
}

@patent{klein1972dopedgate,
  author      = {Klein, Thomas and Faggin, Federico},
  title       = {Doped Semiconductor Electrodes for MOS Type Devices},
  number      = {US 3,673,471},
  holder      = {Fairchild Camera and Instrument Corporation},
  year        = {1972},
  filing_date = {1970-10-08},
  issue_date  = {1972-06-27}
}

@manual{intel4004datasheet,
  organization = {Intel Corporation},
  title        = {4004: Single Chip 4-Bit P-Channel Microprocessor},
  year         = {1974},
  url          = {https://ia601509.us.archive.org/27/items/intel-4004/intel-4004_text.pdf},
  urldate      = {2026-10-10}
}

@manual{intel1973mcs4manual,
  organization = {Intel Corporation},
  title        = {MCS-4 Micro Computer Set User's Manual},
  year         = {1973},
  month        = feb,
  url          = {https://www.4004.com/mcs4-manual/4004-cpu/},
  urldate      = {2026-10-10}
}
```

***

## Eixo 3 — Parâmetros físicos, circuitos e métricas

### Síntese técnica objetiva

#### Capacitância de sobreposição

A capacitância de overlap por terminal é modelada por

\[
C_{ov}=C_{ox}WL_{ov}=\frac{\varepsilon_{ox}}{t_{ox}}WL_{ov}.
\]

A expressão mostra por que o autoalinhamento atuou simultaneamente em velocidade e densidade: reduzir \(L_{ov}\) diminui a carga dinâmica e permite menor pitch entre junções e porta. Para a saída de um estágio inversor, a contribuição efetiva de \(C_{gd,ov}\) pode ser amplificada pela variação oposta das tensões de entrada e saída, o chamado efeito Miller.

Se o processo metálico exigisse uma sobreposição desenhada \(L_{ov,m}\) e o SGT deixasse apenas uma difusão lateral \(L_{lat}\), a razão de primeira ordem seria

\[
\frac{C_{ov,SGT}}{C_{ov,metal}}\approx\frac{L_{lat}}{L_{ov,m}}.
\]

Essa razão é analítica; sem regras geométricas primárias completas dos dois processos não se deve atribuir um número absoluto ao MCS-4. A fonte histórica confirma a minimização da capacitância pelo autoalinhamento, mas não fornece no material acessível um par auditável de \(L_{ov}\) em micrômetros.[^20]

#### Atraso e chaveamento

A aproximação dominante é

\[
\tau_{pd}\approx R_{on}C_L,
\]

com uma forma de 50% frequentemente escrita como

\[
t_{pd}\approx0{,}69R_{eq}C_L.
\]

No 4004, \(C_L\) agregava capacitâncias de gate, overlap, difusão, interconexão e pinos; \(R_{on}\) dependia de mobilidade, geometria, overdrive e efeito de corpo. A SGT reduziu \(C_{ov}\), permitiu menor \(|V_{th}|\) e, com bootstrap, aumentou o overdrive efetivo dos transistores de carga/passagem; os três efeitos reduzem \(R_{on}C_L\).[^15][^16]

#### Clock bifásico e ciclo de instrução

O datasheet especifica período mínimo de clock de 1,36 µs, equivalente a

\[
f_{clk,max}=\frac{1}{1{,}36\ \mu s}\approx735\ \text{kHz}\approx740\ \text{kHz}.
\]

Uma instrução de uma palavra requer oito períodos; logo,

\[
T_{inst}=8T_{clk}\approx8(1{,}36\ \mu s)=10{,}88\ \mu s,
\]

arredondado pela Intel para 10,8 µs. O limite ideal para instruções de uma palavra é cerca de 92,6 mil instruções/s; instruções de duas palavras exigem dezesseis clocks e dois ciclos.[^28]

O clock possuía duas fases não sobrepostas, \(\phi_1\) e \(\phi_2\), com larguras e atrasos definidos no datasheet. Essa temporização sustentava lógica dinâmica/pass-transistor e coordenava o barramento multiplexado entre CPU, ROM e RAM.[^28]

#### Bootstrap de carga ativa

Em uma cadeia PMOS/pass-transistor sem elevação capacitiva, o nó alto útil perde aproximadamente \(|V_{th}|\), agravado pelo body effect. A carga bootstrap acopla uma transição por capacitor ao gate do transistor de carga, deslocando-o temporariamente além do trilho estático apropriado à convenção PMOS e mantendo elevado o overdrive durante a carga do nó.[^15]

O resultado funcional é uma excursão próxima ao trilho completo, em vez de \(V_{supply}-V_{th}\), melhorando margem de ruído e velocidade. Isso permitiu a Faggin usar pass transistors, reduzir contagem de dispositivos e preservar o produto velocidade–potência sem uma máscara adicional.[^15][^3]

Uma representação simplificada do acoplamento é

\[
\Delta V_G\approx\frac{C_B}{C_B+C_{par}}\Delta V_{clk},
\]

onde \(C_B\) é o capacitor bootstrap e \(C_{par}\) reúne capacitâncias parasitas no gate elevado. A melhoria de corrente decorre do maior \(|V_{GS}-V_{th}|\), aproximadamente segundo

\[
I_D\propto\frac{W}{L}(V_{GS}-V_{th})^2
\]

no modelo quadrático de canal longo em saturação.

### Fontes primárias e trechos-chave

| Documento | Dado extraído | Trecho-chave curto |
|---|---|---|
| Intel 4004 datasheet | 10,8 µs; oito clocks; 1,36 µs mínimo; alimentação de 15 V | “10.8 Microsecond Instruction Cycle”[^28] |
| “The History of the 4004” | bootstrap, swing completo, pass transistors, die e transistores | “full supply voltage”[^15][^3] |
| História oral Faggin, ETHW/IEEE | autoalinhamento reduz overlap; poly mascara dopagem | “parasitic capacitances are minimized”[^20] |
| Faggin, “How we made the microprocessor” | SGT 5×, fuga >100× menor, densidade 2× | “five times faster”[^16] |

### Quadro de equações e grandezas

| Grandeza | Expressão | Valor/ordem no caso 4004 | Interpretação |
|---|---|---:|---|
| Capacitância de óxido por área | \(C_{ox}=\varepsilon_{ox}/t_{ox}\) | Depende do processo | Converte área de overlap em capacitância |
| Overlap por borda | \(C_{ov}=C_{ox}WL_{ov}\) | Reduzido por autoalinhamento | Principal vantagem dinâmica da SGT |
| Atraso RC | \(\tau_{pd}\approx R_{on}C_L\) | Ordem de submicrossegundos por fase/caminho crítico | Clock mínimo 1,36 µs delimita o sistema[^28] |
| Frequência máxima | \(f=1/T\) | ≈735–740 kHz | Duas fases, oito períodos por instrução[^28] |
| Instrução de 1 palavra | \(T_{inst}=8T_{clk}\) | 10,88 µs ≈10,8 µs | ≈92,6 kinst/s ideal[^28] |
| Instrução de 2 palavras | \(T_{inst}=16T_{clk}\) | ≈21,76 µs | Dois ciclos de instrução[^28] |
| Densidade bruta | \(N/A\) | 2.300/12 ≈191,7 transistores/mm² | Não é densidade de área ativa |
| Potência DC típica aproximada | \(P\approx VI\) | 15 V × 30 mA ≈450 mW | Datasheet dá corrente média típica de 30 mA nas condições indicadas[^28] |

### Metal-gate PMOS versus silicon-gate PMOS

| Métrica | Metal-gate PMOS contemporâneo | Silicon-gate PMOS | Base e cautela |
|---|---:|---:|---|
| Velocidade de chaveamento | 1× | 3–5×; Faggin reporta 5× no comparativo de processo | Resultado de circuito/processo, não apenas transistor isolado[^1][^16] |
| Fuga de junção | 1× | Mais de 100× menor | Comparação reportada para SGT/Fairchild 3708[^16][^23] |
| Densidade de lógica aleatória | 1× | ≈2× | Requer SGT mais buried contact e metodologia de layout[^16][^24] |
| Área para função equivalente | ≈2× | 1× | Relação histórica; o CPU metálico TI funcionalmente equivalente ao 8008 foi reportado como >2× maior[^3] |
| Densidade estimada para função do 4004 | ≈95,8 transistores/mm² | ≈191,7 transistores/mm² | **Estimativa derivada**, assumindo exatamente 2× de densidade; não é medição de um 4004 metal-gate |
| Área estimada de um 4004 equivalente | ≈24 mm² | 12 mm² | **Contrafactual derivado**; não existiu um die 4004 metal-gate auditável |
| Caso direto 3705/3708 | Área aproximadamente igual por decisão de ferramental | Área aproximadamente igual | O 3708 foi mantido no mesmo tamanho, embora pudesse ser menor; foi 5× mais rápido e ≈100× menos fugente[^23] |

Não existe, nas fontes primárias examinadas, um par fabricado “4004 metal-gate versus 4004 silicon-gate”. Assim, a área de 24 mm² e a densidade de 95,8 transistores/mm² devem aparecer em resultados apenas como projeções por escala, nunca como medidas experimentais. O comparativo direto mais próximo citado pelos autores é o 8008 silicon-gate contra o processador metal-gate da Texas Instruments para a mesma função, cujo die era mais de duas vezes maior e que, segundo a fonte memorial, nunca operou plenamente.[^3]

### Registros BibTeX do Eixo 3

```bibtex
@article{faggin2018howwemade,
  author  = {Faggin, Federico},
  title   = {How We Made the Microprocessor},
  journal = {Nature Electronics},
  volume  = {1},
  pages   = {3},
  year    = {2018},
  doi     = {10.1038/s41928-017-0014-8}
}

@inproceedings{faggin1972mcs4,
  author    = {Faggin, Federico and Shima, Masatoshi and Hoff, Marcian E. and Feeney, Hal and Mazor, Stanley},
  title     = {The MCS-4: An LSI Micro-Computer System},
  booktitle = {Proceedings of the IEEE Region Six Conference},
  pages     = {8--11},
  year      = {1972},
  publisher = {IEEE}
}

@article{faggin1972fourchip,
  author  = {Faggin, Federico and Hoff, Marcian E.},
  title   = {Standard Parts and Custom Design Merge in Four-Chip Processor Kit},
  journal = {Electronics},
  pages   = {112--116},
  year    = {1972},
  month   = apr
}

@misc{faggin2004oralhistory,
  author       = {Faggin, Federico},
  title        = {Oral History: Federico Faggin},
  howpublished = {IEEE History Center / Engineering and Technology History Wiki},
  year         = {2004},
  url          = {https://ethw.org/Oral-History:Federico_Faggin},
  urldate      = {2026-10-10}
}
```

***

## Eixo 4 — Transformações industriais, econômicas e sociais

### Síntese técnica objetiva

#### Mudança de paradigma

O MCS-4 deslocou a diferenciação do produto da topologia de placas e chips customizados para conteúdo de ROM. No modelo anterior, teclado, display, impressora e aritmética podiam exigir controladores ou lógica dedicados; no novo modelo, a CPU executava sequências armazenadas, e alterações de função podiam ser feitas substituindo o padrão da ROM/firmware.[^26][^33]

Isso não eliminou hardware específico: temporização elétrica, sensores, atuadores, drivers de potência e interfaces continuaram necessários. A ruptura foi padronizar o núcleo de controle e mover parte significativa da complexidade para software, reduzindo número de encapsulamentos, NRE de novos ASICs e tempo de alteração de variantes.[^34][^3]

Uma publicação Intel contemporânea posterior afirma que uma placa MCS-4 podia substituir aproximadamente 90 encapsulamentos TTL SSI/MSI em uma aplicação típica. No analisador da Helena Laboratories, um microcomputador em uma placa substituiu três placas e uma fonte, reduziu pela metade o volume eletrônico e foi estimado pela empresa como 30% mais barato.[^34]

#### Sistemas embarcados

As aplicações documentadas com maior segurança incluem calculadoras Busicom, balanças eletrônicas, analisadores de sangue, videogames, taxímetros e controle de semáforos; um relatório histórico da própria Intel identifica semáforos como uma das aplicações iniciais e mais difundidas. A Intel também registrou o uso do conceito em bombas de combustível e controladores de tráfego.[^35][^36]

Caixas registradoras, terminais de ponto de venda, máquinas de faturamento, controle numérico, elevadores, tráfego rodoviário/ferroviário e controle de processo aparecem explicitamente na literatura MCS-4 como classes-alvo. Para rigor histórico, o artigo deve distinguir **aplicações efetivamente documentadas** de **aplicações anunciadas/propostas** no manual e no material de marketing.[^37][^33]

O padrão arquitetural é o de sistema embarcado: CPU, ROM, RAM e I/O integrados em poucos encapsulamentos, programa dedicado e interação com sensores/atuadores. O artigo dos criadores identifica 4004 e 8008 como arquétipos de dois mercados: controle embarcado e computadores programáveis pelo usuário.[^3]

#### Trabalho e automação

A contribuição social do microprocessador deve ser formulada como condição habilitadora, não causalidade monocausal. Controle numérico e automação já existiam; o microprocessador reduziu custo, tamanho e rigidez dos controladores e tornou economicamente viável levar lógica reprogramável a máquinas de menor volume.[^38][^39]

Um estudo contemporâneo do Bureau of Labor Statistics observou que computadores grandes e caros limitavam a automação às instalações massivas, enquanto microprocessadores permitiam máquinas reprogramáveis e adaptáveis a lotes menores. O mesmo estudo advertia que restrições de investimento tornavam improvável uma perda “revolucionária” instantânea de empregos, apesar do aumento do potencial de automação.[^39]

A evidência histórica mais ampla mostra efeitos distributivos: digitalização substituiu tarefas rotineiras manuais e cognitivas, elevou produtividade e alterou a composição ocupacional; análises de CNC associam maior exposição à tecnologia a maior produtividade e menor emprego de produção, ao mesmo tempo que cresceram qualificações e ocupações ligadas a programação, eletrônica, manutenção e integração.[^40][^41][^42]

Portanto, a formulação defensável é que a microeletrônica acelerou a passagem de controle mecânico/eletromecânico e lógica cabeada para controle digital programável, redistribuindo trabalho entre operação repetitiva e funções de projeto, software, instrumentação, manutenção e supervisão. Não é defensável atribuir ao 4004 isoladamente um saldo agregado específico de emprego.[^42][^39]

#### Evolução arquitetural

A linhagem histórica precisa de uma ressalva: 4004 e 8008 não formam uma sequência ISA direta. O 8008 nasceu de um projeto contemporâneo separado para a Computer Terminal Corporation, inicialmente chamado 1201; ficou dormente e foi retomado em 1971 sob supervisão de Faggin, com Hal Feeney no projeto detalhado, usando a metodologia validada no 4004.[^43][^3]

O 8008 evoluiu arquitetural e comercialmente para o 8080. A fonte conjunta atribui o 8080 a Faggin e Shima, com contribuições arquiteturais de Mazor e Hoff; o 8080 tornou viável o Altair 8800, marco da microcomputação pessoal.[^44][^3]

Após deixar a Intel, Faggin cofundou a Zilog com Ralph Ungermann. O Z80 foi concebido para superar o 8080 mantendo compatibilidade de software; a história oral atribui a Shima o projeto lógico e de circuitos e a Faggin a concepção empresarial/arquitetural de produto e forte participação no layout. O primeiro silício funcional surgiu em março de 1976.[^45][^44]

O Z80 difundiu-se em TRS-80, Osborne, Kaypro, MSX e numerosos sistemas embarcados. Já Apple I e Apple II usavam o MOS Technology 6502, não 4004/8008/8080/Z80; devem ser apresentados como parte da mesma revolução de microprocessadores de baixo custo, mas não como descendentes arquiteturais diretos de Faggin.[^46][^47][^44]

### Quadro das aplicações

| Aplicação | Estatuto documental | Função do microprocessador | Fonte |
|---|---|---|---|
| Busicom 141-PF | Uso original comprovado | Aritmética, teclado, display e impressora por firmware | [^13][^3] |
| Balanças eletrônicas/comerciais | Uso inicial documentado pela Intel | Aquisição, conversão, cálculo e display | [^35] |
| Analisador de sangue Helena | Caso documentado | Converte dados do sensor em resultados de proteínas; substitui três placas + fonte | [^34] |
| Semáforos | Uso inicial documentado | Sequenciamento e controle reprogramável | [^35][^48] |
| Bombas de combustível | Aplicação histórica citada pela Intel | Medição, cálculo e controle de operação | [^36] |
| Caixas registradoras/POS | Classe-alvo contemporânea; usos posteriores amplamente relatados | Cálculo, teclado, display, impressão e registro | [^37][^33] |
| Controle de processo/NC/elevadores | Classe-alvo no manual | Substituição de lógica aleatória por firmware | [^33] |
| Videogames/taxímetros | Usos relatados em retrospectiva Intel | Sequenciamento, contagem e interface | [^35] |

### Quadro da linhagem

| Dispositivo/sistema | Ano | Relação histórica | Papel de Faggin | Observação |
|---|---:|---|---|---|
| Intel 4004 | 1971 | Primeira CPU comercial de chip único do MCS-4 | Líder de projeto; circuitos, layout, metodologia e silício | 4 bits, PMOS SGT[^3][^29] |
| Intel 8008 | 1972 | Projeto 1201 separado; metodologia herdada do 4004 | Supervisor; projeto detalhado de Hal Feeney | Não é sucessor ISA do 4004[^43][^3] |
| Intel 8080 | 1974 | Evolução da linha 8008 | Concebido/projetado por Faggin e Shima, com contribuições citadas de Hoff/Mazor | CPU do Altair 8800[^3][^44] |
| Zilog Z80 | 1976 | Extensão compatível do 8080 | Cofundador da Zilog; direção do produto e layout; Shima fez lógica/circuitos | Ampla adoção em micros e embarcados[^45][^44] |
| Apple I/II | 1976/1977 | Revolução paralela de PCs de baixo custo | Nenhum papel direto no CPU | Usavam MOS 6502, não Intel/Zilog[^46] |

### Quadro socioeconômico

| Dimensão | Antes da difusão do microprocessador | Mudança habilitada | Efeito observável/cautela |
|---|---|---|---|
| Projeto eletrônico | Lógica fixa, SSI/MSI, fiação e placas específicas | CPU padrão + ROM/firmware | Menos encapsulamentos e variantes por software[^34] |
| Automação fabril | Relés, lógica cabeada, NC/minicomputadores caros | CNC, robôs e controladores menores reprogramáveis | Difusão em lotes menores; não começou com o 4004[^38][^39] |
| Trabalho operacional | Maior conteúdo de operação/ajuste manual | Execução automática de rotinas e supervisão digital | Redução de algumas tarefas rotineiras[^40][^41] |
| Trabalho técnico | Hardware dedicado por produto | Firmware, programação, manutenção eletrônica e integração | Mudança de composição e demanda por qualificação[^42] |
| Mercado | Fabricantes de computadores concentrados | Entrada de novos fabricantes de sistemas e componentes | Expansão de embarcados e microcomputadores[^3][^44] |

### Fontes primárias e trechos-chave

| Documento | Evidência | Trecho-chave curto |
|---|---|---|
| Intel Annual Report, 1988 | Balanças, analisadores de sangue, jogos, semáforos e taxímetros | “affordable computing power”[^35] |
| Material Intel sobre Helena Laboratories | Redução de placas, volume e custo | “replaced three PC boards plus a power supply”[^34] |
| MCS-4 Users Manual/Data Sheet | Controle, terminais, faturamento, medição e processo | “numeric and process control”[^37] |
| Painel oral Z80, CHM | Divisão de trabalho Faggin–Shima e cronologia | “logic design ... totally Shima’s doing”[^45] |
| BLS, 1982 | Reprogramabilidade e impacto no trabalho | “unique adaptability”[^39] |

### Registros BibTeX do Eixo 4

```bibtex
@techreport{intel1988annualreport,
  author      = {{Intel Corporation}},
  title       = {Intel Corporation 1988 Annual Report: A History of Innovation},
  institution = {Intel Corporation},
  year        = {1988},
  url         = {https://dn721602.ca.archive.org/0/items/intel-history-1988-annual-report/intel-history-1988-annual-report_text.pdf},
  urldate     = {2026-10-10}
}

@misc{chmz80panel2007,
  author       = {Faggin, Federico and Shima, Masatoshi and others},
  title        = {Oral History Panel on the Development of the Zilog Z80 Microprocessor},
  howpublished = {Computer History Museum, Catalog 102658073},
  year         = {2007},
  url          = {https://archive.computerhistory.org/resources/text/Oral_History/Zilog_Z80/102658073.05.01.pdf},
  urldate      = {2026-10-10}
}

@article{bls1982futurework,
  author  = {{U.S. Bureau of Labor Statistics}},
  title   = {The Future of Work: Does It Belong to Us or to the Robots?},
  journal = {Monthly Labor Review},
  year    = {1982},
  month   = sep,
  url     = {https://www.bls.gov/opub/mlr/1982/09/art2full.pdf},
  urldate = {2026-10-10}
}

@article{bergek2019thirdindustrial,
  title   = {Origins and Pathways of Innovation in the Third Industrial Revolution},
  journal = {Industrial and Corporate Change},
  volume  = {28},
  number  = {5},
  pages   = {1125--1148},
  year    = {2019},
  doi     = {10.1093/icc/dty053}
}

@techreport{nber2022cnc,
  title       = {Computerized Machine Tools and the Transformation of U.S. Manufacturing},
  institution = {National Bureau of Economic Research},
  number      = {30400},
  year        = {2022},
  type        = {Working Paper},
  url         = {https://www.nber.org/system/files/working_papers/w30400/w30400.pdf},
  urldate     = {2026-10-10}
}
```

***

## Resultados consolidados para o artigo

A contribuição distintiva de Faggin situa-se na interface entre física de dispositivos e realização de sistemas: ele não originou sozinho a arquitetura do 4004, mas converteu uma especificação ainda incompleta em quatro CIs PMOS de porta de silício, manufaturáveis, testáveis e integrados. O contato enterrado resolveu densidade e roteamento; a carga bootstrap resolveu excursão lógica e velocidade; a metodologia conjunta de lógica, circuito e layout resolveu a ausência de ferramentas e regras de projeto para lógica aleatória complexa.[^16][^1][^3]

O resultado técnico pode ser resumido por três encadeamentos causais: autoalinhamento → menor \(C_{ov}\) → menor atraso; eletrodo de poly dopado → \(\Phi_{ms}\) e \(V_{th}\) mais favoráveis → maior overdrive; poly + buried contact → segunda camada útil → maior densidade de interconexão. Sobre essa base, um die PMOS de 10 µm e 12 mm² integrou aproximadamente 2.300 transistores, operou a cerca de 740 kHz e executou instruções de uma palavra em 10,8 µs.[^30][^29][^28]

O impacto social derivou menos da capacidade aritmética absoluta do 4004 do que da replicabilidade econômica do paradigma: uma CPU padrão, alterada por firmware, podia migrar entre produtos. Essa mudança abriu o mercado de sistemas embarcados, acelerou a automação programável e, pela linha 8008–8080 e pelo Z80 compatível, contribuiu para a microcomputação pessoal; a Apple pertence à mesma transformação histórica, mas pela linhagem concorrente do 6502.[^44][^46][^3]

## Limitações documentais

Os números “5× mais rápido” e “2× mais denso” são resultados históricos de comparações de processo/circuito e não devem ser tratados como constantes universais de dispositivo. Dependem de geometria, carga, circuito, potência e regras de layout; a comparação mais limpa do 3708 com o 3705 manteve deliberadamente área semelhante por razões de ferramental.[^23][^16]

Não foi localizado um 4004 metal-gate funcional para comparação A/B direta. As métricas de 24 mm² e 95,8 transistores/mm² são projeções explicitamente derivadas da razão 2×, enquanto 12 mm², aproximadamente 2.300 transistores, 15 V, 1,36 µs de clock mínimo e 10,8 µs por instrução são dados documentais.[^29][^30][^28]

As listas de aplicações misturam produtos comprovados, classes-alvo de marketing e usos posteriores. Para evitar anacronismo, a redação final deve marcar como comprovados os casos apoiados por documentação Intel/CHM e como “propostos” os exemplos presentes apenas em manual ou anúncio.[^33][^35][^34]

---

## References

1. [[PDF] Oral History Panel on the Development and Promotion of the Intel ...](https://archive.computerhistory.org/resources/access/text/2012/04/102658187-05-01-acc.pdf)

2. [Ted Hoff and Stan Mazor on their contributions to the Intel 4004](http://archive.computerhistory.org/resources/text/Oral_History/Intel_4004/Intel_4004_1.oral_history.2006.102657974.pdf)

3. [The History of the 4004](https://www.computer.org/csdl/magazine/mi/1996/06/m6010/13rRUytWFdY) - The Intel 4004, completed in March 1971, is the world's first microprocessor, the product that spark...

4. [METHOD FOR MAKING MIS STRUCTURES](https://www.perplexity.ai/rest/file-repository/patents/US3475234A?lens_id=152-273-560-986-855) - publication_number: US3475234A
grant_date: 1969-10-28
filing_date: 1967-03-27
application_number: 34...

5. [Frederico Faggin - Computer Pioneers](https://history.computer.org/pioneers/faggin.html) - Biography of pioneer Frederico Faggin from J.A.N. Lee's 1995 book Computer Pioneers, updated

6. [Applications - OUCI](https://ouci.dntb.gov.ua/en/works/ld0bekGl/)

7. [Method for making mis structures](https://patents.google.com/patent/US3475234A/en)

8. [After the IC: Jack Kilby's Solar Misadventure](https://spectrum.ieee.org/after-the-ic-jack-kilbys-solar-misadventure) - The Nobel Prize winner spent a decade trying to create a household solar energy system—and failed

9. [[1703.05342] The Tyranny of Qubits - Quantum Technology's ...](https://ar5iv.labs.arxiv.org/html/1703.05342) - In this essay, I look at (bemoan) the issues surrounding simulating quantum systems in order to desi...

10. [Kilby, Jack St. Clair - TSHA](https://www.tshaonline.org/handbook/entries/kilby-jack-st-clair) - Explore the life and achievements of Jack St. Clair Kilby, the Nobel Prize-winning inventor of the i...

11. [Chips Go Vertical](https://spectrum.ieee.org/chips-go-vertical) - Looking for new ways to make ultrafast chips, designers explore the third dimension

12. [History of Device Integration Technology](https://www.iue.tuwien.ac.at/phd/singulani/dissse1.html)

13. [Announcing a New Era of Integrated Electronics](https://www.intel.com/content/www/us/en/history/virtual-vault/articles/the-intel-4004.html) - Intel’s 4004 microprocessor began as a contract project for Japanese calculator company Busicom. Int...

14. [Celebrating the 50th Anniversary](https://download.intel.com/newsroom/2021/data-center/4004-infographic.pdf)

15. [THE HISTORY OF THE 4004 - IEEE Micro](https://baltazarstudios.com/webshare/A-Z80/Library/The%20History%20of%204004.pdf)

16. [How we made the microprocessor - Nature Electronics](https://www.nature.com/articles/s41928-017-0014-8) - The Intel 4004 is renowned as the world’s first commercial microprocessor. Project leader and design...

17. [intel :: MCS4 :: MCS4 Data Sheet Nov71 : Free Download ...](https://archive.org/details/bitsavers_intelMCS4M_11184923) - From the bitsavers.org collection, a scanned-in computer-related document.intel :: MCS4 :: MCS4 Data...

18. [Silicon Gate Technology Developed for ICs](https://www.computerhistory.org/siliconengine/silicon-gate-technology-developed-for-ics/)

19. [Donald L. Klein](https://ethw.org/Donald_L._Klein)

20. [Oral-History:Federico Faggin](https://ethw.org/Oral-History:Federico_Faggin)

21. [Silicon Gate Technology - Intel 4004](http://www.intel4004.com/sgate.htm)

22. [DOPED SEMICONDUCTOR ELECTRODES FOR MOS TYPE DEVICES](https://www.perplexity.ai/rest/file-repository/patents/US3673471A?lens_id=100-357-381-065-77X) - publication_number: US3673471A
abstract: The threshold voltage required to invert an MOS device is b...

23. [The MOS Silicon Gate Technology - The Intel 4004](http://www.intel4004.com/mosgate.htm)

24. [The New Methodology for Random Logic Design - Intel 4004](http://www.intel4004.com/mrld.htm)

25. [世界最初のマイクロプロセッサーIntel 4004 - 佐野研究室](http://www.sanosemi.com/history_of_intel4004.pdf)

26. [[PDF] The History of the Microcomputer--Invention and Evolution](https://pages.cs.wisc.edu/~markhill/restricted/MKreadings2000percaitlin/ieee_Proceedings_1995_mazor.pdf)

27. [Inventing The Microprocessor: The Intel 4004](https://hackaday.com/2018/01/29/inventing-the-microprocessor-the-intel-4004/) - We recently looked at the origins of the integrated circuit (IC) and the calculator, which was the I...

28. [ia601509.us.archive.org · 27 · itemsintel-4004-datasheet - Internet Archive](https://ia601509.us.archive.org/27/items/intel-4004/intel-4004_text.pdf)

29. [88](https://www.nature.com/articles/s41928-017-0014-8.pdf)

30. [Intel 4004 CPU MCS-4 microcomputer set - CHM Revolution](https://www.computerhistory.org/revolution/digital-logic/12/285/1528) - The 4004 chip was manufactured on 2-inch diameter, p-channel silicon gate MOS technology wafers with...

31. [Say Happy 50th Birthday to the Microprocessor, Part I - EE Journal](https://www.eejournal.com/article/say-happy-50th-birthday-to-the-microprocessor-part-i/) - The same year that I began my quest for a BSEE at Case Western Reserve University in 1971, someone p...

32. [MCS-4 Users Manual: III. 4 Bit Central Processor Unit (CPU ...](https://www.4004.com/mcs4-manual/4004-cpu/) - III. 4 Bit Central Processor Unit (CPU) — 4004 of Intel’s MCS-4 Users Manual (1974), pages 7–17: mac...

33. [Intel 4004 emulator assembler disassembler](http://e4004.szyc.org/) - A JavaScript emulator assembler disassembler for the Intel 4004 CPU

34. [Untitled - Computer History Museum - Archive Server](https://archive.computerhistory.org/resources/access/text/2024/06/102776829-05-0001-acc.pdf)

35. [Intel Corporation 1988 Annual Report - Archive.org](https://dn721602.ca.archive.org/0/items/intel-history-1988-annual-report/intel-history-1988-annual-report_text.pdf)

36. [Next 40 Years of Computing](https://download.intel.com/newsroom/kits/40thanniversary/pdfs/Justin_Rattner_Opinion_Piece.pdf)

37. [Intel intel microcomputer kit](https://safe-manuals.com/user-manual/intel/intel-microcomputer-kit) - User manual for Intel intel microcomputer kit product. View intel microcomputer kit user guide onlin...

38. [Origins and pathways of innovation in the third industrial revolution 1](https://academic.oup.com/icc/article/28/5/1125/5193703) - Abstract. This study examines the factors that shaped the long-term evolution of the information and...

39. [[PDF] The future of work: does it belong to us or to the robots? - BLS.gov](https://www.bls.gov/opub/mlr/1982/09/art2full.pdf)

40. [NOVEMBER 2016](https://www.ilo.org/media/428071/download)

41. [[PDF] Computerized Machine Tools and the Transformation of US ... - NBER](https://www.nber.org/system/files/working_papers/w30400/w30400.pdf)

42. [[PDF] Employment Effects of Computerization, 1971-1991.[Working Paper ...](https://files.eric.ed.gov/fulltext/ED447333.pdf)

43. [Oral History Panel on the Development and Promotion of the ...](https://archive.computerhistory.org/resources/text/Oral_History/Intel_8008/Intel_8008_1.oral_history.2006.102657982.pdf)

44. [Chip Hall of Fame: Zilog Z80 Microprocessor](https://spectrum.ieee.org/chip-hall-of-fame-zilog-z80-microprocessor) - Another legend from the 8-bit era, this processor powered the first portable computer as well as the...

45. [archive.computerhistory.org · Zilog_Z80 · 102658073Z80_1.oral_history.2007.102658073_all_final - Computer History...](https://archive.computerhistory.org/resources/text/Oral_History/Zilog_Z80/102658073.05.01.pdf)

46. [2/18/20](https://www.cs.cmu.edu/~15292/assets/slides/10-PersonalComputer.pdf)

47. [Zilog, Inc. | Selling the Computer Revolution](https://www.computerhistory.org/brochures/t-z/zilog-inc/)

48. [Intel Marks 30th Anniversary Of The Microprocessor](https://www.intel.com/pressroom/archive/releases/2001/20011115corp_a.htm)

