# Catálogo Ontológico de Tags e Grafo de Memória Relacional

**Arquivo:** `utils/memory/episodes/tag_ontology.md`  
**Escopo:** Vocabulário controlado para anotação semântica e episódica de iterações no desenvolvimento do artigo acadêmico sobre Federico Faggin e o Intel 4004.

---

## 1. Eixos Ontológicos Primários

### 1.1 Eixo de Domínio Técnico e Científico (`#domain/...`)
- `#domain/physics/capacitance`: Modelagem analítica de capacitâncias parasitas ($C_{ox}$, $C_{ov}$), capacitância Miller dinamicamente amplificada em $C_{gd}$, sobreposição lateral $L_{diff,lat}$ e atrasos transitórios $\tau_{pd}$.
- `#domain/physics/threshold`: Eletrostática da tensão de limiar $V_{th}$, diferença de função de trabalho $\Delta\Phi_{ms}$, cargas fixas de óxido $Q_{ss}$, orientação cristalográfica $\langle 100 \rangle$ e aprisionamento iônico (*gettering*) com $\text{POCl}_3$.
- `#domain/physics/bootstrap`: Circuitos dinâmicos de carga com capacitor de elevação $C_B$, excursão de porta $\Delta V_G \approx \Delta V_{out}$ e saturação plena $V_{out} = V_{DD}$ sem degradação de limiar.
- `#domain/physics/materials`: Termodinâmica da interface silício-óxido, autodifusão e resistência térmica do polissilício, migração de silício (*spiking* de alumínio) e túneis difusos.
- `#domain/architecture/faggin-contributions`: Contatos enterrados (*buried contacts*), roteamento ortogonal em duas camadas (polissilício e alumínio), encapsulamento DIP de 16 pinos e síntese manual da lógica aleatória.
- `#domain/history/faggin-lineage`: Atribuição historiográfica das inovações da Fairchild (1968), MCS-4 / Intel 4004 (1970--1971), 8008 (1972), 8080 (1974) e Zilog Z80 (1976).
- `#domain/history/parallel-projects`: Confronto analítico com TMS 1000 (Texas Instruments), AL1 (Four-Phase Systems) e CADC MP944 (Garrett AiResearch).
- `#domain/socioeconomics`: Transição de ASICs customizados para *standard parts*, deslocamento de valor econômico para firmware (ROM/RAM), desverticalização fabril e sistemas embarcados na indústria e robótica (ASEA IRB 6, estudos BLS e NBER).

### 1.2 Eixo de Falhas e Desvios Críticos (`#flaw/...`)
- `#flaw/equation-duplication`: Re-dedução de equações já formalizadas na Seção II (violação do protocolo anti-redundância).
- `#flaw/style/bold-inline`: Emprego proibido de `\textbf{}` no corpo do parágrafo ou listas.
- `#flaw/style/semicolon`: Uso proibido de ponto e vírgula (`;`) na pontuação textual.
- `#flaw/style/em-dash`: Uso proibido de travessões parentéticos (em-dash `—` ou en-dash `–`).
- `#flaw/style/ai-jargon`: Emprego de clichês retóricos de IA ou academicismos vazios (*"alta heterogeneidade topológica"*, *"confluência interdisciplinar"*, *"vértices epistêmicos"*).
- `#flaw/style/promotional-hype`: Uso de adjetivos promocionais sem embasamento físico estrito (*"revolucionário"*, *"divisor de águas"*, *"astronômicos"*).
- `#flaw/style/list-addiction`: Fragmentação artificial da prosa contínua em blocos de `itemize` ou `enumerate`.

### 1.3 Eixo de Ações Corretivas e Fixes (`#fix/...`)
- `#fix/cross-ref-delta`: Substituição de equações duplicadas por referências cruzadas explícitas (`\cref{eq:...}`).
- `#fix/prose-cohesion`: Fusão de períodos curtos e orações truncadas em parágrafos narrativos coesos.
- `#fix/sobriety-rewrite`: Substituição de adjetivações retóricas por descrições causais diretas de engenharia.
- `#fix/linter-clean`: Eliminação de resíduos sintáticos detectados pelo script determinístico.

### 1.4 Eixo de Integridade do Compilador e Build (`#build/...`)
- `#build/exit-0`: Compilação não-interativa executada com código de retorno zero.
- `#build/undefined-ref`: Ocorrência de referências cruzadas ausentes (`LaTeX Warning: Reference undefined`).
- `#build/undefined-cite`: Ocorrência de chaves bibliográficas órfãs (`LaTeX Warning: Citation undefined`).
- `#build/overfull-box`: Extravasamento de margem horizontal (`overfull \hbox`).
- `#build/multiply-defined`: Rótulos duplicados no documento (`multiply-defined label`).

---

## 2. Gramática de Relações Bidirecionais

Cada episódio conecta-se explicitamente aos seus antecedentes, dependências e correções:

- `supersedes`: Aponta para o `episode_id` anterior da mesma seção que foi substituído pelo episódio atual.
- `depends_on`: Identifica seções ou arquivos dos quais este episódio herda formulações ou contexto conceitual.
- `addressed_by`: Aponta para o `episode_id` subsequente encarregado de corrigir os desvios identificados neste episódio.
- `references_eq`: Lista os rótulos matemáticos (`eq:...`) herdados da Seção II para ancoragem analítica.
