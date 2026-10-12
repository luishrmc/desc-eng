# Memória Epistêmica de Avaliação (`critic_rubric_telemetry.md`)

Este arquivo consolida a rubrica formal de auditoria técnica, critérios de rigor físico, convenções historiográficas e registro de verificações de conformidade executadas pelo `technical-critic-agent`.

---

## 1. Convenções Historiográficas e Atribuição de Patentes
- **Patente US 3.475.234 ("Method for Making MIS Structures"):**
  - Concedida em 1969 à Bell Telephone Laboratories.
  - Inventores: Robert E. Kerwin, Donald L. Klein e John C. Sarace.
  - Natureza: Prova conceitual de laboratório com porta de silício, instável e não comercializável.
- **Patente US 3.673.471 ("Doped Semiconductor Electrodes for MOS Type Devices"):**
  - Concedida em 1972 à Fairchild Camera and Instrument Corporation.
  - Inventores: Thomas Klein e Federico Faggin.
  - Natureza: Industrialização da tecnologia de porta autoalinhada de silício (SGT) com silício policristalino dopado e validação no Fairchild 3708.
- **Patente US 3.699.646 ("Integrated Circuit Structure and Method for Making Same"):**
  - Concedida em 1972 à Intel Corporation.
  - Inventor nominal: Leslie L. Vadasz (concebida e aplicada pioneiramente por Federico Faggin no Intel 4004).
  - Natureza: Contato enterrado (*buried contact*) entre polissilício e difusão no substrato.
- **Patente US 3.821.715 ("Memory System for Multi-Chip Digital Computer"):**
  - Concedida em 1974 à Intel Corporation.
  - Inventores: Marcian E. Hoff, Stanley Mazor e Federico Faggin.
  - Natureza: Arquitetura de barramento multiplexado e sistema de memória do MCS-4.

---

## 2. Invariantes de Rigor Físico e Microarquitetura
- Transistores PMOS operados em enriquecimento com substrato tipo n.
- Redução de capacitância de sobreposição $L_{ov}$ eliminando tolerâncias fotolitográficas manuais ($\Delta L_{align} = 0$).
- Elevação de potencial dinâmico (*bootstrapping*) garantindo excursão plena $V_{out} = V_{DD}$.
- Partição de alimentação: $V_{SS} = +5\text{ V}$ e $V_{DD} = -10\text{ V}$ para compatibilidade direta de nível alto com circuitos TTL.
- Encapsulamento DIP cerâmico padrão de 16 pinos com barramento multiplexado de 4 bits sob relógio bifásico a 740 kHz.

---

## 3. Invariantes de Estilo e Restrições Negativas
- **Travessões no texto em português:** PROIBIDO (0 tolerância para *em-dash* "—" ou *en-dash* "–").
- **Ponto e vírgula (";"):** PROIBIDO em qualquer parte do texto, inclusive em itens de listas.
- **Uso de \textbf{} no corpo do texto:** PROIBIDO no corpo da prosa e nas listas. Permitido exclusivamente em cabeçalhos de tabelas (\toprule).
- **Jargões empolados e academicismos de IA:** PROIBIDO ("alta heterogeneidade topológica", "filtros críticos rigorosos", "confluência interdisciplinar", "vértices epistêmicos"). Exigir tom natural e direto de engenharia.
- **Uso inflado de adjetivos:** Moderar vocábulos como "fundamental", "crítico" ou "essencial", exigindo suporte funcional concreto.
- **Excesso de listas:** Teto de no máximo uma lista por seção. Proibir a fragmentação de explicações narrativas em tópicos.
- **Jargões promocionais e adjetivos vazios:** PROIBIDO ("revolucionário", "crucial", "pioneiro", "divisor de águas").
- **Integridade referencial:** Todas as chaves `\cite{}` devem ter registro correspondente e válido em `pos_textuais/01_referencias.bib`.
