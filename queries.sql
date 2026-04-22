SELECT * FROM users;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM order_items;

SELECT u.full_name, o.status from users u
INNER JOIN orders o ON u.id = o.user_id;

SELECT p.name, oi.quantity FROM products p 
INNER JOIN order_items oi on p.id = oi.product_id;

SELECT u.full_name, SUM(oi.price_at_purchase * oi.quantity) AS total_spent
from users u 
INNER JOIN orders o ON u.id = o.user_id 
INNER JOIN order_items oi ON o.id = oi.order_id
GROUP BY u.full_name
ORDER BY total_spent DESC;

SELECT order_id, COUNT(*) AS total_order from order_items 
group by order_id
HAVING COUNT(*) > 1;

WITH best_sell AS (select p.name, SUM(oi.quantity) AS total_sold
FROM products p INNER JOIN order_items oi ON p.id = oi.product_id GROUP by p.name)
SELECT * FROM best_sell ORDER BY total_sold DESC;

SELECT p.category, SUM(oi.price_at_purchase * oi.quantity) AS revenue
from products p 
INNER JOIN order_items oi ON p.id = oi.product_id 
GROUP BY p.category
ORDER BY revenue DESC;

