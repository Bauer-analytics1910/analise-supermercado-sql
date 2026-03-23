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
SELECT AVG(Total) AS ticket_medio
FROM supermarket;

-- 👥 Tipo de cliente que mais gasta
SELECT "Customer type", SUM(Sales) AS total_gasto
FROM supermarket
GROUP BY "Customer type"
ORDER BY total_gasto DESC;

