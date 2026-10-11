# Relatório Técnico de Pesquisa e Mineração Documental para a Seção III: Metodologia

Este relatório consolida a investigação documental, epistemológica e técnica destinada a fundamentar a Seção III (Metodologia) do artigo sobre Federico Faggin e a realização do Intel 4004. O documento foi estruturado para alimentar a memória do projeto em `utils/memory/research_cache_metodologia.md` e subsidiar a redação de `secoes/03_metodologia.tex`.

***

## 1. Classificação Epistemológica e Abordagem de Pesquisa

### 1.1 Natureza do Estudo
O trabalho classifica-se como uma pesquisa histórica, analítica e documental, de caráter interdisciplinar, situada na confluência entre a física de dispositivos semicondutores de estado sólido, a engenharia de processos de microeletrônica e a microarquitetura de computadores.

### 1.2 Enquadramento Historiográfico e Técnico
A historiografia tradicional da computação frequentemente privilegia uma perspectiva funcional e abstrata. Nessa ótica reducionista, a emergência do microprocessador é retratada como a formulação lógica de um conjunto de instruções ou a elaboração de diagramas de blocos em nível de sistema, negligenciando as severas barreiras materiais, termodinâmicas e eletrostáticas que delimitavam a viabilidade dos circuitos integrados no início da década de 1970. Paralelamente, a historiografia especializada em física do estado sólido costuma focar no comportamento isolado de estruturas MOS elementares, sem abordar os desafios de sua integração massiva em blocos de lógica aleatória complexa.

O enquadramento adotado neste estudo estabelece uma ponte metodológica entre a história da tecnologia e a modelagem analítica de circuitos integrados. Examina-se como limitações físicas fundamentais (capacitâncias parasitas de sobreposição, instabilidade de tensão de limiar, efeito Miller e resistência de interconexão) condicionaram de forma determinística as decisões arquiteturais (multiplexação temporal em barramento de 4 bits, distribuição de comandos e temporização sob relógio bifásico). Dessa forma, a transição entre o projeto conceitual e o dispositivo manufaturável é analisada não como um ato de engenharia rotineira, mas como um processo de síntese técnica onde a física de materiais rege as fronteiras da arquitetura.

***

## 2. Corpus Documental Detalhado

O corpus documental foi estabelecido a partir da consulta exaustiva a acervos primários contemporâneos de patentes, folhas de dados industriais, manuais de projeto, artigos técnicos de época e transcrições de história oral de arquivos abertos.

### 2.1 Fontes Primárias

#### Patente Bell Laboratories (US Patent 3.475.234)
* Título: "Method for Making MIS Structures"
* Inventores: Robert E. Kerwin, Donald L. Klein e John C. Sarace
* Depositante: Bell Telephone Laboratories, Incorporated
* Datas: Depósito em 27 de março de 1967, concessão em 28 de outubro de 1969
* Papel e conteúdo técnico: Constitui a prova conceitual de laboratório para a tecnologia de porta autoalinhada em estruturas Metal-Isolante-Semicondutor. A reivindicação principal estabelece a utilização de uma camada de silício amorfo como máscara física contra a difusão de impurezas nas regiões de fonte e dreno, tornando o eletrodo simultaneamente condutor. No entanto, o processo da Bell Labs sofria com fragilidade mecânica e quebras da fina película evaporada nos degraus do óxido térmico, não apresentando viabilidade comercial ou estabilidade elétrica reproduzível em escala industrial.

#### Patente Fairchild Camera and Instrument Corporation (US Patent 3.673.471)
* Título: "Doped Semiconductor Electrodes for MOS Type Devices"
* Inventores: Thomas Klein e Federico Faggin
* Depositante: Fairchild Camera and Instrument Corporation
* Datas: Depósito em 8 de outubro de 1970, concessão em 27 de junho de 1972
* Papel e conteúdo técnico: Documenta a industrialização da Tecnologia de Porta de Silício (SGT). Protege o método de controle e deslocamento seletivo da tensão de limiar ($V_{th}$) de dispositivos MOS mediante a dopagem degenerada com impurezas tipo p (boro) do eletrodo de silício policristalino depositado por fase de vapor (CVD). O documento detalha a redução de aproximadamente 1,1 V na magnitude de $V_{th}$ em transistores PMOS e descreve a aplicação de tratamentos térmicos em alta temperatura com captura iônica por fósforo (phosphorus gettering), mitigando correntes de fuga e a deriva de limiar provocada por íons de sódio. Essa base tecnológica foi validada no circuito integrado Fairchild 3708 em 1968.

#### Patentes Intel Corporation

1. Patente US 3.699.646:
* Título: "Integrated Circuit Structure and Method for Making Same"
* Inventor nominal: Leslie L. Vadasz
* Atribuição técnica real: Concebido e aplicado por Federico Faggin na Fairchild em 1968 e transferido ao projeto do Intel 4004 em 1970
* Depositante: Intel Corporation
* Datas: Depósito em 28 de dezembro de 1970, concessão em 24 de outubro de 1972
* Papel e conteúdo técnico: Protege a estrutura e o fluxo de fabricação do contato enterrado (buried contact). Estabelece uma junção ôhmica direta silício-silício entre a camada condutora de polissilício e as difusões no substrato monocristalino, eliminando a exigência de ilhas de alumínio e aberturas de contato vertical com metal. Essa inovação transformou o polissilício em uma segunda camada condutora de roteamento, viabilizando a integração de 2.300 transistores na pastilha de 12 mm² do Intel 4004. A omissão dessa etapa no primeiro lote experimental de dezembro de 1970 paralisou o funcionamento do processador, atestando seu papel estrutural na densidade da pastilha.

2. Patente US 3.821.715:
* Título: "Memory System for Multi-Chip Digital Computer"
* Inventores: Marcian E. Hoff, Stanley Mazor e Federico Faggin
* Depositante: Intel Corporation
* Datas: Depósito em 22 de janeiro de 1973, concessão em 28 de junho de 1974
* Papel e conteúdo técnico: Documenta a arquitetura de barramento compartilhado multiplexado e o sistema de sincronização e memória da família MCS-4. Estabelece a decodificação de endereços e transferência de instruções e dados em um barramento comum bidirecional de 4 bits entre a Unidade Central de Processamento (4004), a memória de programa ROM (4001) e a memória de dados RAM (4002), viabilizando um sistema computacional completo restrito a encapsulamentos cerâmicos DIP de 16 pinos.

#### Manuais Técnicos Contemporâneos e Especificações Industriais
* Intel MCS-4 Micro Computer Set Data Sheet (Novembro de 1971): Especificação original contemporânea ao anúncio público comercial. Fornece os parâmetros absolutos de operação elétrica, incluindo a tensão de alimentação unipolar de 15 V entre trilhos ($V_{SS} - V_{DD} = 15\text{ V}\pm 5\%$), os diagramas temporais das duas fases de relógio não sobrepostas ($\phi_1$ e $\phi_2$) com período mínimo de 1,35 $\mu$s a 1,36 $\mu$s (frequência de 740 kHz a 750 kHz) e a duração do ciclo básico de instrução de 8 períodos (10,8 $\mu$s para instruções simples de 1 byte).
* Intel MCS-4 Micro Computer Set Users Manual (Fevereiro de 1973, Revisão 4): Manual técnico detalhado descrevendo a organização interna e o mapa de sinais dos quatro componentes da família (4001, 4002, 4003 e 4004). Contém a decomposição sequencial dos oito subciclos de instrução (A1, A2, A3, M1, M2, X1, X2 e B), a descrição dos 16 pinos de cada circuito integrado, a pinagem física em encapsulamento DIP de 16 pinos e o repertório formal de 46 instruções.

#### Memoriais Técnicos e Historiografia Oral dos Criadores
* Faggin, F. e Klein, T., "Silicon Gate Technology", Solid-State Electronics, vol. 13, n. 8, pp. 1125-1144, 1970: Artigo seminal com a caracterização física e fenomenológica do processo SGT comercial, contendo medidas experimentais de mobilidade superficial, densidades de carga de interface e propriedades de folha do polissilício dopado.
* Faggin, F., Hoff, M. E., Mazor, S. e Shima, M., "The History of the 4004", IEEE Micro, vol. 16, n. 6, pp. 10-20, 1996: Artigo conjunto assinado pelos quatro protagonistas técnicos fundamentais. Estabelece o consenso formal sobre a divisão de responsabilidades, detalha as fases de projeto lógico e projeto de circuito, e documenta as dimensões físicas da pastilha ($3{,}0\text{ mm} \times 4{,}0\text{ mm}$), as técnicas de carga bootstrap e a resolução da falha de processamento na camada de contato enterrado.
* Faggin, F., "Silicon: From the Invention of the Microprocessor to the New Science of Consciousness", Waterside Productions, 2021: Relato autobiográfico contendo descrições técnicas detalhadas sobre a invenção do circuito dinâmico de carga bootstrap, o roteamento ortogonal em lógica aleatória e as relações contratuais entre Intel e Busicom.
* Painel de História Oral do Computer History Museum sobre o Intel 4004 (Catálogo 102658187, Referência X4024.2007, 2007): Transcrição da acareação presencial entre Federico Faggin, Hal Feeney, Ted Hoff, Stanley Mazor e Masatoshi Shima, moderada por Dave House. Provê registros orais sobre os conflitos cronológicos, a divergência de escopo da Busicom (12 circuitos versus 8 ou 9 tipos de LSI) e a situação do projeto em abril de 1970.
* História Oral de Federico Faggin (Computer History Museum, Catálogo 102658025, 2004): Entrevista conduzida por Rob Gardner focalizando as inovações em física de semicondutores desenvolvidas na Fairchild e na Intel.

### 2.2 Fontes Secundárias

#### Tratados Clássicos de Física de Dispositivos e Projeto VLSI
* Sze, S. M. e Ng, K. K., "Physics of Semiconductor Devices", 3ª edição, John Wiley and Sons, 2006: Tratado de referência para a modelagem analítica da capacitância do óxido ($C_{ox}$), cálculo do potencial de Fermi ($\phi_F$), densidade de carga espacial de depleção ($Q_B$), diferença de potencial de contato ($\Phi_{ms}$) e efeito da orientação cristalográfica do substrato (<111> versus <100>) na densidade de estados de interface.
* Mead, C. A. e Conway, L. A., "Introduction to VLSI Systems", Addison-Wesley, 1980: Obra estruturante sobre a metodologia de projeto hierárquico em silício, regras de escalamento geométrico (scaling laws) e disciplina de roteamento de interconexões ortogonais em circuitos MOS.
* Weste, N. H. E. e Harris, D. M., "CMOS VLSI Design: A Circuits and Systems Perspective", 4ª edição, Addison-Wesley, 2011: Fundamentação para modelos analíticos de atraso de propagação RC ($\tau_{pd}$), avaliação de resistência equivalente de condução ($R_{on}$) e impacto da capacitância parasita Miller durante comutações transitórias.

#### Artigos Analíticos e Historiográficos do IEEE
* Morton, J. A. e Pietenpol, W. J., "The Technological Impact of Transistors", Proceedings of the IRE, vol. 46, n. 6, pp. 955-959, 1958: Artigo original que formula o conceito da "tirania dos números" como o estrangulamento de sistemas complexos pelo crescimento combinatório de componentes discretos e pontos de conexão física.
* Noyce, R. N. e Hoff, M. E., "A History of Microprocessor Development at Intel", IEEE Micro, vol. 1, n. 1, pp. 8-21, 1981: Artigo memorial que reconstitui a transição estratégica da Intel de fornecedora especializada de memórias para desenvolvedora de unidades centrais de processamento programáveis.
* Cavin, R. K., Lugli, P. e Zhirnov, V. V., "Evolution of Research on Semiconductors and Computation", Proceedings of the IEEE, vol. 100, n. 13, pp. 1720-1742, 2012: Revisão histórica e analítica sobre a coevolução entre a física do estado sólido e os paradigmas de processamento da informação digital.

***

## 3. Método de Triangulação Epistêmica e Validação Cruzada

### 3.1 Os Três Vértices Epistêmicos
A metodologia do estudo fundamenta-se na triangulação sistemática e convergente entre três vértices de evidência:
- Vértice 1: Modelagem Analítica de Primeira Ordem da Física de Semicondutores.
- Vértice 2: Evidências Materiais Contemporâneas (1969-1974).
- Vértice 3: Testemunhos Diretos e Historiografia Oral dos Projetistas.

### 3.2 Critérios Metodológicos de Mitigação de Viés Retrospectivo
1. Acareação Cruzada de Testemunhos Divergentes.
2. Primazia do Registro Documental e Material Contemporâneo.
3. Auditoria Analítica por Leis Físicas e Distinção de Cenários Contrafactuais.

***

## 4. Especificação Técnica da Figura 3 (Fluxograma Metodológico)
* Arquivo no repositório: `img/metodologia_triangulacao.pdf`
* Rótulo sugerido: `\label{fig:metodologia_triangulacao}`
* Dimensionamento sugerido: `width=\columnwidth`
* Legenda técnica formal: "Fluxograma do método de triangulação epistêmica empregado no estudo. A convergência entre a modelagem analítica da física de semicondutores (Vértice A), o corpus documental contemporâneo de patentes e manuais técnicos (Vértice B) e os relatos dos projetistas e história oral (Vértice C) assegura a validação cruzada dos parâmetros técnicos, mitigando distorções retrospectivas e estabelecendo a distinção precisa entre a concepção microarquitetural e a realização material em silício."
