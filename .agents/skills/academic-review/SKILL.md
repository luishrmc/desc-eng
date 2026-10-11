---
name: academic-review
description: Formal evaluation rubric assessing semiconductor physics accuracy, microelectronics history fidelity, and academic prose quality.
---
# Academic Reviewer

Motor de auditoria textual e conceitual para revisao por pares em artigos sobre microeletronica e historia dos semicondutores.

## Quando Utilizar
Ative esta skill quando:
- Auditar a precisao cientifica de explicacoes fisicas sobre dispositivos MOS, porta de aluminio e porta autoalinhada em silicio.
- Verificar a atribuicao correta de creditos historicos entre os membros da equipe MCS-4 (Faggin, Hoff, Mazor, Shima) e a empresa contratante Busicom.
- Avaliar a conformidade metodologica do artigo com base no plano diretor em `utils/tema.md` e regras em `utils/docs/ref/`.

Nao ative quando:
- Compilar o documento ou corrigir erros de sintaxe de macros LaTeX.
- Modificar arquivos de texto diretamente.

## Dimensoes da Rubrica de Avaliacao

### 1. Fidelidade a Fisica de Semicondutores
- Transistores MOS convencionais: presenca de sobreposicao litografica entre porta e juncoes de dreno/fonte, gerando capacitancia de Miller elevada.
- Porta autoalinhada de silicio (SGT): emprego de polissilicio como mascara refrataria durante as etapas de difusao, anulando a sobreposicao fisica.
- Tensao de limiar e polarizacao: analise adequada das propriedades de trabalho da pastilha e do processo PMOS do Intel 4004.

### 2. Rigor Historico e Contextual
- Papel de Faggin na Fairchild: desenvolvimento do processo de fabricacao da porta de silicio e do circuito integrado comercial 3708 em 1968.
- Papel de Faggin na Intel: projeto do conjunto MCS-4 (chips 4001, 4002, 4003 e 4004), lideranca tecnica e layout dos transistores em silicio.
- Distincao conceitual: arquitetura logica (proposta por Hoff e Mazor) versus viabilizacao fisica em chip unico (projetada por Faggin e Shima).

### 3. Higiene Estilistica Academica
- Eliminacao de jargoes mercadologicos e termos inflacionados.
- Coesao entre paragrafos sem o uso de conectivos artificiais.
- Eliminacao estrita de travessoes e ponto e virgula.

## Esquema de Parecer JSON
```json
{
  "section": "secoes/02_fundamentacao.tex",
  "decision": "REJECT",
  "score": 6.8,
  "rubric_scores": {
    "physics_accuracy": 6.0,
    "historical_fidelity": 8.0,
    "argumentation_flow": 7.5,
    "style_hygiene": 6.0
  },
  "deficiencies": [
    {
      "severity": "CRITICAL",
      "category": "physics_accuracy",
      "issue": "Confusao entre processo NMOS e processo PMOS na descricao da pastilha original.",
      "remediation": "Ajustar o texto para indicar a utilizacao de transistores de canal p com substrato tipo n."
    }
  ],
  "can_proceed": false
}
```

## Restricoes Negativas
- Proibido emitir parecer `APPROVE` se existirem deficiencias de severidade `CRITICAL`.
- Proibido sugerir alteracoes que violem a organizacao de pastas do repositorio.
