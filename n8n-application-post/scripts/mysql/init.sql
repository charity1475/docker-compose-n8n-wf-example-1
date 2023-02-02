USE mydatabase;
CREATE TABLE IF not exists products (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  price DECIMAL(6,2) NOT NULL,
  created_on DATETIME
);

INSERT INTO products (id, name, price, created_on)
VALUES 
  (1, 'Product 1', 9.5, NOW()), 
  (2, 'Product 2', 29.99, NOW()), 
  (3, 'Product 3', 30, NOW()), 
  (4, 'Product 4', 3.2, NOW()), 
  (5, 'Product 5', 9.99, NOW()), 
  (6, 'Product 6', 6.2, NOW()), 
  (7, 'Product 7', 43.9, NOW()), 
  (8, 'Product 8', 89.99, NOW()), 
  (9, 'Product 9', 100, NOW()),
  (10, 'Product 10', 10.99, NOW());