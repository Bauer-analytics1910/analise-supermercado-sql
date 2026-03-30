-- =========================
-- 📊 ANÁLISE DE VENDAS
-- =========================
-- ⏰ SALES BY HOUR (DATA CLEANING APPLIED)
-- =========================
-- The original Time column is in 12-hour format (AM/PM),
-- which is not natively recognized by SQLite date functions.
-- Therefore, a manual transformation was applied to convert
-- the values into 24-hour format before performing the analysis.

SELECT 
    CASE 
        WHEN Time LIKE '%PM' AND CAST(SUBSTR(Time, 1, INSTR(Time, ':') - 1) AS INTEGER) < 12
            THEN CAST(SUBSTR(Time, 1, INSTR(Time, ':') - 1) AS INTEGER) + 12
        WHEN Time LIKE '%AM' AND CAST(SUBSTR(Time, 1, INSTR(Time, ':') - 1) AS INTEGER) = 12
            THEN 0
        ELSE CAST(SUBSTR(Time, 1, INSTR(Time, ':') - 1) AS INTEGER)
    END AS hour_24,
    COUNT(*) AS total_sales,
    ROUND(SUM(Sales), 2) AS total_revenue
FROM supermarket
GROUP BY hour_24
ORDER BY total_revenue DESC;


-- 💰 Faturamento total
SELECT 
    ROUND(SUM(Sales), 2) AS total_revenue
FROM supermarket;

-- 🏙️ Faturamento por cidade
SELECT City, SUM(Sales) AS faturamento
FROM supermarket
GROUP BY City
ORDER BY faturamento DESC;

-- 🛍️ Produtos mais vendidos
SELECT "Product line", SUM(Quantity) AS total_vendido
FROM supermarket
GROUP BY "Product line"
ORDER BY total_vendido DESC;

-- 💳 Métodos de pagamento mais utilizados
SELECT Payment, COUNT(*) AS total
FROM supermarket
GROUP BY Payment
ORDER BY total DESC;

-- 📈 Ticket médio
SELECT AVG(Sales) AS ticket_medio
FROM supermarket;

-- 👥 Tipo de cliente que mais gasta
SELECT "Customer type", SUM(Sales) AS total_gasto
FROM supermarket
GROUP BY "Customer type"
ORDER BY total_gasto DESC;

-- 📅 FATURAMENTO POR DIA DA SEMANA
-- (0 = Domingo, 1 = Segunda, ..., 6 = Sábado)
SELECT 
    CASE CAST(strftime('%w', Date) AS INTEGER)
        WHEN 0 THEN 'Domingo'
        WHEN 1 THEN 'Segunda-feira'
        WHEN 2 THEN 'Terça-feira'
        WHEN 3 THEN 'Quarta-feira'
        WHEN 4 THEN 'Quinta-feira'
        WHEN 5 THEN 'Sexta-feira'
        WHEN 6 THEN 'Sábado'

 -- Ticket Médio: Membros vs Clientes Normais
SELECT 
    "Customer type", 
    COUNT(*) AS total_vendas,
    ROUND(AVG(Sales), 2) AS ticket_medio,
    ROUND(SUM(Sales), 2) AS faturamento_total
FROM supermarket
GROUP BY 1
ORDER BY ticket_medio DESC;

-- Linha de produto favorita por gênero
SELECT 
    Gender, 
    "Product line", 
    SUM(Quantity) AS total_itens
FROM supermarket
GROUP BY Gender, "Product line"
ORDER BY Gender, total_itens DESC;

-- As 3 categorias que geram maior lucro bruto (Gross Income)
SELECT 
    "Product line", 
    ROUND(SUM("gross income"), 2) AS lucro_total,
    ROUND(AVG("gross margin percentage"), 2) AS margem_media
FROM supermarket
GROUP BY 1
ORDER BY lucro_total DESC
LIMIT 3;

-- Ranking de faturamento das cidades sem usar GROUP BY simples
SELECT 
city,
"product line",
SUM(Sales) OVER (PARTITION BY city, "Product line") AS 
faturamento_categoria_cidade,
RANK() OVER (PARTITION BY City
ORDER BY SUM(SALES) DESC) AS
ranking_na_cidade
FROM customer_order
GROUP BY city, "Product line";

-- 🧠 Frequência de compra por tipo de cliente

SELECT 
    "Customer type",
    COUNT(*) AS total_compras,
    ROUND(COUNT(*) * 1.0 / (SELECT COUNT(*) FROM supermarket), 2) AS proporcao
FROM supermarket
GROUP BY "Customer type";

-- 🧾 Clientes que compram mais itens por compra

SELECT 
    "Customer type",
    ROUND(AVG(Quantity), 2) AS media_itens
FROM supermarket
GROUP BY "Customer type"
ORDER BY media_itens DESC;

-- 🏆 Produto mais lucrativo (não só vendido)

SELECT 
    "Product line",
    ROUND(SUM("gross income"), 2) AS lucro_total
FROM supermarket
GROUP BY "Product line"
ORDER BY lucro_total DESC;

-- ⭐ Média de avaliação por categoria de produto
SELECT 
    "Product line", 
    ROUND(AVG(Rating), 2) AS media_satisfacao,
    COUNT(*) AS total_avaliacoes
FROM supermarket
GROUP BY 1
ORDER BY media_satisfacao DESC;
