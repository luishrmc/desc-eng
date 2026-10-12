## 🚀 Optimized Prompt 

Com base nas diretrizes de GEMINI.md, elabore a especificacao formal da arquitetura multiagente para a escrita incremental das secoes do artigo academico. 
 
Contexto operacional:
O resumo do artigo ja foi elaborado e revisado. O desenvolvimento deve prosseguir de forma modular para as secoes seguintes. 
 
Instrucoes de execucao:
1. Inspecionar os arquivos main.tex e o diretorio `secoes/` para identificar a estrutura do documento e determinar qual secao deve ser escrita imediatamente apos o resumo.
2. Definir formalmente os cinco agentes estabelecidos na secao 2 de GEMINI.md (`orchestrator-agent`, `retriever-agent`, `latex-author-agent`, `latex-compiler-agent`, `technical-critic-agent`), especificando para cada um: 
 - Papel principal e atribuicoes tecnicas
 - Modelo atribuido (pro ou flash) 
 - Skills e ferramentas autorizadas (garantindo modo estrito de leitura para consulta e isolamento para escrita e compilacao)
 - Regras de governanca e condicoes de acionamento 
3. Detalhar a maquina de estados da malha fechada para a execucao de cada secao: 
 - Sequencia de transicao entre recuperacao de evidencias, redacao, compilacao e auditoria tecnica 
 - Protocolo de aprovacao e criterios formais para liberar a transicao de secao
 - Procedimento de mitigacao de falhas com teto de cinco iteracoes e comando exato de reversao no git
4. Apresentar o plano de acao imediato para redigir a primeira secao subsequente ao resumo.
 
Restricoes obrigatorias: 
- Nao utilizar travessoes em-dash ou en-dash 
- Nao utilizar ponto e virgula 
- Nao incluir adjetivos promocionais como pioneiro, revolucionario ou crucial
- Respeitar a exclusividade de escrita do redator e a exclusividade de compilacao do compilador

Condicao de parada e controle de fluxo:
- Modo de operacao: [Interativo por secao / Autonomo continuo]
- No modo interativo, interrompa a execucao e retorne o controle ao usuario imediatamente apos a aprovacao formal da secao em andamento.
- No modo continuo, prossiga para a proxima secao apenas se a anterior obtiver parecer formal de aprovacao, interrompendo o ciclo caso qualquer secao atinja o teto de cinco iteracoes sem convergencia.