DROP TABLE shoes;

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
    kids BOOLEAN not NULL
);

INSERT INTO shoes
    (name, color, size, brand, type, price, mens, womens, kids)
VALUES
    ('Cool Air', 'White', 10, 'Psych', 'Trainer', 89.99, true, true, false),
    ('Cambridge', 'Black', 7, 'Clerks', 'Dress Shoe', 64.99, true, false, false),
    ('Still Here', 'Red', 5, 'Shoes Galore', 'Highheel', 129.99, false, true, false),
    ('Tiny Aligator', 'Greed', 13, 'Psych', 'Sandal', 35.99, false, false, true);

