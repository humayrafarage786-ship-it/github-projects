
##H - ECO
Reporte Cidadão de estado de contentores de lixo
Proposta de projecto

##Nome do Projecto
h-eco uma aplicação móvel de reporte de estado de contentores de lixo, com notificação directa às autoridades municipais de recolha de lixo.

##Enquadramento do projecto
 - 2.1   Ideia e Descrição
O h-eco é uma aplicação móvel que permite a qualquer cidadão reportar, em tempo real, o estado de enchimento de um contentor de lixo que são: medio ou cheio através da inserção do código do contentor ou do QR code afixado no contentor. O reporte exige uma fotografia do contentor e captura automática da localização do utilizador, isto para impedir repórtes falsos ou feitos a distâncias do contentor. Também o Utilizador pode entrar na aplicação e localizar contentores próximos em que possa deitar lixo.
Os operadores de recolha municipal recebem notificações automáticas sempre que um contentor da sua zona é marcado como cheio. Ao efetuar a recolha do lixo colocam o contentor como recolhido com uma fotografia tirada também diretamente pelo app e depois o estado fica como vazio, ficando o contentor disponível para novos repórtes.
- 2.2    Pesquisa sobre o contexto
Entre janeiro e meados de setembro de 2025, o portal da Queixa registrou 266 reclamações sobre higiene urbana em portugal. um aumento de 10% face ao ano anterior com os concelhos de Lisboa, Almada e Sintra a liderar o número de ocorrências, e queixas centradas sobretudo em lixo acumulado nas ruas, contentores cheios e falta de recolha atempada.

##2.3    Objetivos
Reduzir o tempo médio entre um contentor ficar cheio e sua efetiva recolha;
Aumentar a eficiência das equipas de recolha, direcionado-as apenas para contentores efetivamente cheios
Criar um canal de participação cívica simples e de baixo esforço para o cidadão comum;
Gerar um histórico de dados que permita estimar a taxa de enchimento de cada contentor e prever quando irá voltar a encher-se;
Reduzir a incidência de lixo acumulado fora dos contentores, motivada por contentores já cheios, podendo o cidadão procurar um contentor vazio ainda  a sair de casa.

##    Público alvo
Cidadão reportante - morador ou qualquer pessoa de idade e literacia digital, com motivação cívica ou incômodo pessoal. Interage com a app de forma pontual e rápida.
Operador de recolha municipal - trabalhador de campo das equipas de higiene urbana, que usa a app em contexto operacional, priorizando rapidez e clareza sobre estética.
- 2.5   Pesquisa sobre outras aplicações existentes


Sensoneo (Eslováquia) - a sua app cidadã informa sobre o contentor vazio mais próximo, tipo de
resíduo e nível de enchimento, mas os dados provêm de sensores de ultrassom instalados fisicamente em cada contentor — é um sistema apenas de leitura, sem reporte por cidadãos.
Contentores inteligentes da Lipor (Portugal) -  projeto-piloto em Gondomar, Póvoa de Varzim, Valongo e Vila do Conde, com mais de 10 mil aberturas registadas até ao final de abril. Foca-se na separação de recicláveis via sensores por contentor, não no reporte de estado por utilizadores.

##"Na Minha Rua" (Câmara Municipal de Lisboa) - portal municipal genérico de reporte de problemas urbanos, com secção de higiene urbana. É um canal lento e genérico, sem QR code, sem verificação por foto ou localização, e sem notificação direta às equipas de recolha.



|Solução |Requer sensores físicos |Repórte por cidadãos |Verificação antifraude|Notificação direta ao operador|
|---|---|---|---|
|Sensoneo| sim |Nao |N\A |Sim |
|Lipor|Sim | Nao |N\A| sim
|Na minha rua (CML)|Nao | Sim |Nao|Nao|
|h-eco| Nao |Sim |Sim |Sim|


O h-eco posiciona-se entre estas duas abordagens: não exige investimento em hardware por contentor, mas oferece um fluxo dedicado, rápido e verificado, combinado a fiabilidade de um sistema verificado com custo reduzido
##O sistema recolhe a localização GPS do reporte e confirma a proximidade ao contentor.
o utilizador seleciona o estado observado: médio ou cheio.
O utilizador confirma o envio
Caso o estado reportado seja cheio, o sistema notifica automaticamente os operadores.
##

 -  3.2  Guião - Operador marca contentor como recolhido
O operador recebe uma notificação de contentor cheio.
Abre a app e consulta a lista/mapa de contentores filtrados por estado “cheio”.
Desloca-se até ao contentor indicado e procede à recolha.
Marca o contentor como recolhido na app
O sistema registra e reseta o estado para vazio e o contentor fica disponível para novos reportes.


 
##3.3    Guião - Cidadão consulta o mapa antes de se deslocar para depositar lixo
O cidadão pretende depositar lixo e abre a app h-eco.
Vê logo o mapa com contentores sem necessidade de efectuar qualquer scan.
Visualiza contentores próximos, coloridos por estado (Verde/Amarelo?Vermelho).
Escolhe o contentor com mais espaço disponível.
Desloca-se até ao contentor selecionado.

##Plano de trabalhos
O trabalho será desenvolvido ao longo de 14 semanas, seguindo uma metodologia ágil, com entregas nas semanas 4, 9 e 14, coincidindo com os marcos definidos no briefing do projeto.
Nas semanas 1-2, estaremos na análise e conceptualização: definição da idea, pesquisa de mercado, casos de utilização e requisitos. Nas semanas 3-4 o trabalho avança para prototipagem inicial wireframes em figma e modelação preliminar da base de dados e para consolidação desta proposta.
Entre as semanas 5 e 9 , vamos concentrar-se na implementação do backend (API REST), base de dados MYSQL e no arranque da app Android, culminando num protótipo funcional para a 2 entrega.
Das semanas 10 a 14, o trabalho passa para integração completa entre app, backend e base de dados, implementação do método numérico de estimativa da taxa de enchimento dos contentores, testes de usabilidade e a preparação da documentação final para a 3 entrega.

###Project charter e WBS
 - 5.1  Project charter (Síntese)

Nome do projeto


Objectivo
Reduzir o tempo entre contentores cheios e sua recolha, através de reporte do cidadão
Contexto
Projeto Mobile - Licenciatura em Engenharia Informática, IADE
Estudante
[Humaira]


 - 5.2  Work Breakdown Structure (WBS)

Fase
Principais tarefas
Análise e Conceção
Definição de requisitos, casos de utilização, modelo de domínio e pesquisa de mercado
Planeamento
Plano de trabalhos, calendarização, configuração do repositório github
Prototipagem
Wireframes e protótipos Figma
Implementação
Desenvolvimento da app Android, APi Rest, Base de dados e integração do método numérico
Teste
Testes de usabilidade
Apresentação
Apresentação final


6. Requisitos
- 6.1 Requisitos Funcionais

Código
Descrição
- RF01
Criar conta / autenticar-se
- RF02
O utilizador deve poder pesquisar contentores próximos e disponíveis para depositar lixo
- RF03
O utilizador deve poder reportar o estado de um contentor
- RF04
O utilizador deve poder consultar histórico dos próprios reportes
- RF05
O Operador deve poder visualizar contentores por estado
- RF06
O Operador deve poder marcar um contentor como recolhido
- RF07
O sistema deve poder notificar os operadores quando um contentor estiver cheio
- RF08
O  Sistema de estimar previsão de enchimento com base no histórico


- 6.2 Requisitos não funcionais

Categoria
Requisito
Usabilidade
Fluxo de reporte (scan -> foto -> estado -> enviar) completável em menos de 30 segundos
Privacidade
Fotos e localização tratadas como dados pessoais
Disponibilidade
Funcionamento com conectividade instável, disponibilidade 24/24
Performance
Notificação ao operador em menos de 1 minuto após o reporte
Escalabilidade
Preparada para múltiplos municípios sem redesenho estrutural
Segurança
Prevenção de reportes falsos

