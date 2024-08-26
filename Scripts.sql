CREATE TABLE public.ventas (
	id SERIAL PRIMARY KEY,
    producto VARCHAR(100) NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10, 2) NOT NULL,
    fecha_venta TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO ventas (producto, cantidad, precio_unitario)
VALUES 
    ('iPhone 14', 3, 999.99),
    ('Samsung Galaxy S23', 4, 799.99),
    ('MacBook Air M2', 1, 1199.99),
    ('Dell XPS 13', 2, 999.99),
    ('Sony WH-1000XM4', 5, 299.99),
    ('Nintendo Switch', 6, 299.99),
    ('Apple Watch Series 8', 2, 399.99),
    ('Google Pixel 7', 3, 699.99),
    ('Bose QuietComfort 45', 4, 329.99),
    ('Xbox Series X', 1, 499.99),
    ('PlayStation 5', 1, 499.99),
    ('Razer DeathAdder V2', 7, 49.99),
    ('Logitech MX Master 3', 5, 99.99),
    ('Kindle Paperwhite', 3, 129.99),
    ('GoPro HERO10', 2, 399.99),
    ('Samsung QLED TV 65"', 1, 1499.99),
    ('LG OLED TV 55"', 1, 1299.99),
    ('Amazon Echo Dot (4th Gen)', 10, 49.99),
    ('Dyson V15 Detect', 1, 699.99),
    ('Sony PlayStation VR2', 2, 549.99);