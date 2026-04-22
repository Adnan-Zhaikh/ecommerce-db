CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  full_name VARCHAR(100) NOT NULL,
  email VARCHAR(50) NOT NULL UNIQUE,
  phone VARCHAR(15),
  age INTEGER CHECK (age >= 18),
  address TEXT,
  joined_at TIMESTAMP DEFAULT NOW()
  );

CREATE TABLE products (
    id             SERIAL PRIMARY KEY,
    name           VARCHAR(100) NOT NULL,
    category       VARCHAR(50) NOT NULL,
    price          NUMERIC(10,2) NOT NULL CHECK (price > 0),
    stock_quantity INTEGER DEFAULT 0 CHECK (stock_quantity >= 0)
);

CREATE TABLE orders (
    id          SERIAL PRIMARY KEY,
    user_id     INTEGER NOT NULL REFERENCES users(id),
    status      VARCHAR(20) DEFAULT 'pending',
    ordered_at  TIMESTAMP DEFAULT NOW()
);

CREATE TABLE order_items (
    id                SERIAL PRIMARY KEY,
    order_id          INTEGER NOT NULL REFERENCES orders(id),
    product_id        INTEGER NOT NULL REFERENCES products(id),
    quantity          INTEGER NOT NULL CHECK (quantity > 0),
    price_at_purchase NUMERIC(10,2) NOT NULL
);
