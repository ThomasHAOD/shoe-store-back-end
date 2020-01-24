DROP TABLE shoes_orders;
DROP TABLE orders;
DROP TABLE shoes;
DROP TABLE users;

CREATE TABLE users
(
    ID SERIAL PRIMARY KEY,
    email VARCHAR(20),
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    street VARCHAR(30),
    town VARCHAR(15),
    post_code VARCHAR(10)
);

INSERT INTO users
    (email, first_name, last_name, street, town, post_code)
VALUES
    ('tam_od@yaya.ya', 'Tam', 'OD', '1 Street Road', 'Edinburgh', 'EH1 1CC'),
    ('jmikey@yaya.ya', 'Jim', 'Michaels', '14 Fast Lane', 'London', 'W15 3UX'),
    ('jamesS@yaya.ya' , 'James', 'Stevenson', '234 Moon Cresent', 'Glasgow', 'G1 5UI');

CREATE TABLE shoes
(
    ID SERIAL PRIMARY KEY,
    name VARCHAR(30) not NULL,
    color VARCHAR(10) not NULL,
    size INT2 not NULL,
    brand VARCHAR(30) not NULL,
    type VARCHAR(10) not NULL,
    price REAL not NULL,
    mens BOOLEAN not NULL,
    womens BOOLEAN not NULL,
    kids BOOLEAN not NULL,
    stock INT2 not NULL
);

INSERT INTO shoes
    (name, color, size, brand, type, price, mens, womens, kids, stock)
VALUES
    ('Cool Air', 'White', 10, 'Psych', 'Trainer', 89.99, true, true, false, 3),
    ('Cambridge', 'Black', 7, 'Clerks', 'Dress Shoe', 64.99, true, false, false, 1),
    ('Still Here', 'Red', 5, 'Shoes Galore', 'Highheel', 129.99, false, true, false, 10),
    ('Tiny Aligator', 'Greed', 13, 'Psych', 'Sandal', 35.99, false, false, true, 15);

CREATE TABLE orders
(
    ID SERIAL PRIMARY KEY,
    user_id INT8 REFERENCES users(id) ON DELETE SET NULL,
    order_date TIMESTAMP
);

CREATE TABLE shoes_orders
(
    ID SERIAL PRIMARY KEY,
    shoe_id INT8 REFERENCES shoes(id) ON DELETE SET NULL,
    order_id INT8 REFERENCES orders(id) ON DELETE SET NULL
);