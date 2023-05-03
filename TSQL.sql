-- Fournis un fichier TSQL créant le schéma adéquat pour la base de données

-- -Un produit a un nom et un prix

-- -Une catégorie a un nom

-- -Chaque achat d'un produit est enregistré dans une table (OneToMany)

-- -Un achat a lieu à une date précise et sur un produit précis

-- -Le stock d'un produit est enregistré dans une table

-- -un produit peut exister sans être en stock

-- -Le stock d'un produit inexistant ne peut pas exister
CREATE DATABASE TSQL;

CREATE TABLE Category (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE Product (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    price DECIMAL(10,2),
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES Category(id)
);

CREATE TABLE Purchase (
    id INT PRIMARY KEY,
    product_id INT,
    purchase_date DATE,
    FOREIGN KEY (product_id) REFERENCES Product(id)
);

CREATE TABLE Stock (
    product_id INT PRIMARY KEY,
    quantity INT,
    FOREIGN KEY (product_id) REFERENCES Product(id)
);


-- Ecris une seule requête de sélection renvoyant les stocks de tous les produits d'une seule et même catégorie

SELECT p.name, s.quantity
FROM Product p
JOIN Stock s ON p.id = s.product_id
WHERE p.category_id = 1;


-- Créer un jeu de données de test dans le fichier TSQL qui respecte les points suivants:
-- - au moins 3 catégories
-- - 9 produits
-- - 18 achats


INSERT INTO Category (name)
VALUES ('Category 1'), ('Category 2'), ('Category 3');

INSERT INTO Product (name, price, category_id)
VALUES 
('Product 1', 10.0, 1),
('Product 2', 15.0, 1),
('Product 3', 20.0, 1),
('Product 4', 25.0, 2),
('Product 5', 30.0, 2),
('Product 6', 35.0, 2),
('Product 7', 40.0, 3),
('Product 8', 45.0, 3),
('Product 9', 50.0, 3);

INSERT INTO Purchase (product_id, quantity, date)
VALUES
(1, 1, '2023-04-30'),
(2, 2, '2023-04-30'),
(3, 3, '2023-04-29'),
(4, 4, '2023-04-29'),
(5, 5, '2023-04-28'),
(6, 6, '2023-04-28'),
(7, 7, '2023-04-27'),
(8, 8, '2023-04-27'),
(9, 9, '2023-04-26'),
(1, 10, '2023-04-26'),
(2, 11, '2023-04-25'),
(3, 12, '2023-04-25'),
(4, 13, '2023-04-24'),
(5, 14, '2023-04-24'),
(6, 15, '2023-04-23'),
(7, 16, '2023-04-23'),
(8, 17, '2023-04-22'),
(9, 18, '2023-04-22');