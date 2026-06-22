🛒 Supermarket Sales Performance: End-to-End BI Solution


<img width="881" height="338" alt="dashboard_supermarket2" src="https://github.com/user-attachments/assets/21e1fce1-76ca-451f-b2ee-1326accc7dfe" />



📊 Sobre o Projeto

Este projeto consiste no desenvolvimento de uma solução de Business Intelligence completa para analisar o desempenho de uma rede de supermercados. O objetivo foi transformar dados brutos de vendas numa ferramenta de tomada de decisão interativa, focada em responder a questões estratégicas sobre faturamento, comportamento do consumidor, picos de operação e satisfação do cliente (C-SAT).

Fonte dos Dados: Supermarket Sales (Kaggle)

🛠️ Ferramentas e Tecnologias

Microsoft Power BI: Construção do Dashboard, UI/UX e Data Storytelling.

Power Query (Linguagem M): Processos de ETL, limpeza e transformação de dados.

DAX (Data Analysis Expressions): Criação de medidas, KPIs e regras de negócio.

Modelagem de Dados: Estruturação em Star Schema (Fato e Dimensões).

⚙️ A Arquitetura da Solução (O Processo)

Para garantir que o dashboard fosse performático e escalável, o projeto não se baseou apenas em arrastar gráficos, mas sim numa arquitetura de dados robusta dividida em 4 pilares:

1. ETL e Tratamento de Dados (Power Query)

Os dados originais (em formato .csv) apresentavam desafios de formatação regional.

Limpeza Tipográfica: O principal desafio foi a formatação de números decimais com pontos (padrão americano) sendo lidos incorretamente em sistemas locais. O problema foi resolvido via Power Query alterando a localidade da extração (Usando a Localidade > Inglês (EUA)).

Otimização: Remoção de etapas automáticas de "Tipo Alterado" redundantes para melhorar a velocidade de atualização do modelo.

2. Modelagem de Dados (Star Schema)

<img width="683" height="341" alt="star_schema_supermarket" src="https://github.com/user-attachments/assets/bfbaf81e-9d88-4161-93f7-659c872023c0" />

Em vez de trabalhar com um "Tabelão" plano (Flat Table), a base original foi normalizada num modelo Star Schema para otimizar as consultas DAX:

Tabela Fato: fVendas (contendo as chaves estrangeiras e valores transacionais).

Tabelas Dimensão: Criadas via referência no Power Query e remoção de duplicatas (dProduto, dLocalidade, dPagamento, dTipoCliente, dGenero).

Calendário Dinâmico: Criação de uma dCalendario em DAX para análises temporais (Time Intelligence).

3. Regras de Negócio e DAX

As métricas foram isoladas numa tabela dedicada (_Medidas) para facilitar a manutenção.

Faturamento Real vs Receita Bruta: O faturamento foi calculado usando o custo dos produtos vendidos (COGS), isolando as taxas de impostos cobradas na nota.

Cálculos de Margem: Criação de medidas precisas de Margem de Lucro % (DIVIDE([Lucro Bruto Total], [Faturamento Total])) e Ticket Médio por transação.

Engenharia de Recursos (Feature Engineering): Criação de uma coluna calculada Hora Inteira = HOUR(fVendas[Time]) para agrupar centenas de transações em blocos de horas, permitindo a análise de picos de movimento.

4. UI/UX e Data Storytelling

O design do painel foi construído focado no nível executivo (C-Level):

Densidade de Informação: Layout em Grid de 3 colunas para acomodar 6 análises gráficas e 5 KPIs sem poluição visual.

Clean Design: Uso de fundos contrastantes (cartões brancos sobre fundo cinza claro com sombras) para destacar os dados ("Efeito Apple").

Uso Inteligente de Visuais: Substituição de gráficos de pizza repetitivos por Árvores Hierárquicas/Funis e formatação condicional de eixos (ex: Eixo X da Avaliação Média começando no 6.0) para evidenciar diferenças subtis entre categorias.

💡 Principais Insights de Negócio

Após o tratamento avançado e a modelagem, os dados revelaram insights cruciais para a operação do supermercado:

Picos de Operação e Escala (Time Management):

A extração da hora da compra revelou que o horário de 19h lidera isoladamente o volume financeiro ($37,8 Mil), indicando forte fluxo pós-horário comercial.

Ação sugerida: Reforço de funcionários nos caixas às 19h e janelas de reposição de gôndolas antes das 10h e no meio da tarde.

O Impacto do Programa de Fidelidade:

O gráfico de Tipos de Cliente prova que o programa compensa: clientes 'Member' geraram $180,6 Mil em faturamento contra apenas $126,9 Mil dos clientes 'Normal'. O clube de fidelidade é o grande motor da receita.

Experiência do Cliente (C-SAT):

A avaliação média global é de 6.97. No entanto, analisando por categoria, o setor de Food and Beverages não só é um dos campeões de venda para o público feminino, como também lidera o ranking de satisfação global (Nota 7.11). O departamento de 'Home and Lifestyle' precisa de atenção (Nota 6.84).

Meios de Pagamento:

Forte adoção de Ewallet (34,74%) e Cash (34,06%). A ausência de hegemonia do cartão de crédito exige que o supermercado mantenha caixas com troco rápido, ao mesmo tempo em que investe em leitores NFC e parcerias de Cashback digital.

