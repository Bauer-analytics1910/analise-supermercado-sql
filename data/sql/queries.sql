-- =========================
-- 📊 ANÁLISE DE VENDAS
-- =========================

-- 💰 Faturamento total
SELECT SUM(Total) AS faturamento_total
FROM supermarket;

-- 🏙️ Faturamento por cidade
SELECT City, SUM(Total) AS faturamento
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
SELECT "Customer type", SUM(Total) AS total_gasto
FROM supermarket
GROUP BY "Customer type"
ORDER BY total_gasto DESC;

-- ⏰ Horário com mais vendas
SELECT strftime('%H', Time) AS hora, COUNT(*) AS total_vendas
FROM supermarket
GROUP BY hora
ORDER BY total_vendas DESC;
