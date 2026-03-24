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
Um dos desafios deste projeto foi a coluna de tempo, que estava no formato 12h (AM/PM). Utilizei uma lógica de CASE WHEN com manipulação de strings (SUBSTR, INSTR) para converter os dados para o formato 24h, permitindo uma análise precisa da distribuição de vendas ao longo do dia.

🕒 Análise de Pico de Faturamento
Através da limpeza dos dados de tempo e agrupamento por hora, identificamos os períodos de maior atividade financeira no supermercado:

Pico Principal: O horário das 19h lidera o faturamento com aproximadamente $39.699,51. Isso sugere um grande fluxo de clientes realizando compras após o horário comercial.

Janelas de Oportunidade: Observamos picos secundários às 13h ($34.723,23) e às 10h ($31.421,48).

Insight de Negócio: Estes dados auxiliam na tomada de decisão para:

Escalonamento de funcionários nos caixas para evitar filas nos horários de pico.

Planejamento de reposição de gôndolas (especialmente produtos frescos) antes das 10h e das 18h.
