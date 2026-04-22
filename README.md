# 🛒 E-Commerce Database — PostgreSQL Project

A relational database project simulating a real-world e-commerce backend, built with PostgreSQL and hosted on [Neon.tech](https://neon.tech). Covers schema design, relationships, indexing, and analytical queries.

---

## 🗄️ Database Schema

The database consists of 4 tables:

| Table | Description |
|---|---|
| `users` | Stores customer information |
| `products` | Product catalog with categories and pricing |
| `orders` | Order records linked to users |
| `order_items` | Individual items within each order |

### Relationships

- A **user** can place many **orders** (one-to-many)
- An **order** can contain many **order_items** (one-to-many)
- A **product** can appear in many **order_items** (one-to-many)

---

## ⚡ Indexes

Indexes were created on frequently queried foreign key columns to optimize JOIN and lookup performance:

```sql
CREATE INDEX idx_orders_user_id ON orders(user_id);
CREATE INDEX idx_order_items_order_id ON order_items(order_id);
CREATE INDEX idx_order_items_product_id ON order_items(product_id);
CREATE INDEX idx_users_email ON users(email);
```

Performance was verified using `EXPLAIN ANALYZE` to confirm Index Scans over Sequential Scans.

---

## 📋 Queries

### 1. Basic Table Reads
```sql
SELECT * FROM users;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM order_items;
```

### 2. User Orders — INNER JOIN
Fetch each user alongside their order status.
```sql
SELECT u.full_name, o.status
FROM users u
INNER JOIN orders o ON u.id = o.user_id;
```

### 3. Product Quantities Sold — INNER JOIN
Fetch each product with how many units were ordered.
```sql
SELECT p.name, oi.quantity
FROM products p
INNER JOIN order_items oi ON p.id = oi.product_id;
```

### 4. Total Spent Per Customer — Multi-table JOIN + Aggregation
Ranks customers by total money spent across all orders.
```sql
SELECT u.full_name, SUM(oi.price_at_purchase * oi.quantity) AS total_spent
FROM users u
INNER JOIN orders o ON u.id = o.user_id
INNER JOIN order_items oi ON o.id = oi.order_id
GROUP BY u.full_name
ORDER BY total_spent DESC;
```

### 5. Orders With Multiple Items — GROUP BY + HAVING
Filters orders that contain more than one item.
```sql
SELECT order_id, COUNT(*) AS total_order
FROM order_items
GROUP BY order_id
HAVING COUNT(*) > 1;
```

### 6. Best-Selling Products — CTE
Uses a Common Table Expression to rank products by total units sold.
```sql
WITH best_sell AS (
  SELECT p.name, SUM(oi.quantity) AS total_sold
  FROM products p
  INNER JOIN order_items oi ON p.id = oi.product_id
  GROUP BY p.name
)
SELECT * FROM best_sell ORDER BY total_sold DESC;
```

### 7. Revenue by Category — Aggregation
Calculates total revenue generated per product category.
```sql
SELECT p.category, SUM(oi.price_at_purchase * oi.quantity) AS revenue
FROM products p
INNER JOIN order_items oi ON p.id = oi.product_id
GROUP BY p.category
ORDER BY revenue DESC;
```

---

## 🛠️ Setup

This project runs on [Neon.tech](https://neon.tech) (serverless PostgreSQL).

1. Create a free account on Neon.tech
2. Create a new project and database
3. Open the SQL Editor and run `schema.sql` first
4. Then run `seed.sql` to insert sample data
5. Run any queries from `queries.sql`

---

## 🧠 Concepts Covered

- Relational schema design with foreign keys
- INNER JOINs across multiple tables
- Aggregations with `SUM`, `COUNT`, `GROUP BY`
- Filtering aggregations with `HAVING`
- Common Table Expressions (CTEs) with `WITH`
- Index creation and performance analysis with `EXPLAIN ANALYZE`


## 👤 Author

**Adnan** — CS Student, Mumbai University  
Building toward full-stack and backend development with PostgreSQL, Python, and more.
