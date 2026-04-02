📊 Análise de Dados de Vendas: Supermarket Sales.
Este projeto consiste em uma análise exploratória de dados (EDA) de uma rede de supermercados, utilizando SQL para extrair insights estratégicos sobre faturamento, comportamento do consumidor e performance de produtos.

O objetivo é responder perguntas de negócio como:
-Qual o horário de maior pico de vendas para otimização de escala de funcionários?
-Quais categorias de produtos são mais rentáveis por gênero?
-Como o tipo de cliente (Membro vs Normal) afeta o ticket médio?

Ferramentas Utilizadas
-SQL (SQLite): Para manipulação e consulta dos dados.
-Dataset: [Supermarket Sales (Kaggle)]

Destaques da Análise:
Limpeza e Transformação de Dados:

Um dos desafios deste projeto foi a coluna de tempo, que estava no formato 12h (AM/PM). 
Utilizei uma lógica de CASE WHEN com manipulação de strings (SUBSTR, INSTR) para converter os dados para o formato 24h, permitindo uma análise precisa da distribuição de vendas ao longo do dia.

🕒 Análise de Pico de Faturamento
Através da limpeza dos dados de tempo e agrupamento por hora, identificamos os períodos de maior atividade financeira no supermercado:

Pico Principal: O horário das 19h lidera o faturamento com aproximadamente $39.699,51. Isso sugere um grande fluxo de clientes realizando compras após o horário comercial.

Janelas de Oportunidade: Observamos picos secundários às 13h ($34.723,23) e às 10h ($31.421,48).

Insight de Negócio: Estes dados auxiliam na tomada de decisão para:

Escalonamento de funcionários nos caixas para evitar filas nos horários de pico.

Planejamento de reposição de gôndolas (especialmente produtos frescos) antes das 10h e das 18h.

💳 Preferências de Pagamento
A análise dos métodos de pagamento revela uma distribuição equilibrada entre as três principais modalidades, com uma leve predominância de tecnologias digitais:

Ewallet (345 transações): É o método mais utilizado, indicando um público que adota soluções digitais e pagamentos via smartphone.

Cash (344 transações): O uso de dinheiro em espécie segue extremamente próximo da carteira digital, mostrando que métodos tradicionais ainda são vitais para o negócio.

Credit Card (311 transações): O cartão de crédito aparece em terceiro lugar, com uma diferença pequena para os demais.

💡 Insight de Negócio:

Com a Ewallet na liderança, o supermercado pode investir em programas de fidelidade baseados em aplicativos ou parcerias de cashback com carteiras digitais. Além disso, a paridade com o dinheiro em espécie (Cash) reforça a necessidade de manter processos eficientes de frente de caixa para ambos os tipos de fluxo.

Segmentação Geográfica: Através de Window Functions, mapeamos o ranking de categorias por cidade. Isso permite estratégias de estoque regionalizadas (Ex: Priorizar estoque de 'Sports and travel' em Mandalay).

