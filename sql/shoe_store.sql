DROP TABLE shoes;
DROP TABLE users;


CREATE TABLE users
(
    ID SERIAL PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    house_number VARCHAR(5),
    street VARCHAR(30),
    town VARCHAR(15),
    post_code VARCHAR(10)
);

INSERT INTO users
    (first_name, last_name, house_number, street, town, post_code)
VALUES
    ('Tam', 'OD', '1', 'Street Road', 'Edinburgh', 'EH1 1CC'),
    ('Jim', 'Michaels', '3', 'Fast Lane', 'London', 'W15 3UX'),
    ('James', 'Stevenson', '145', 'Moon Cresent', 'Glasgow', 'G1 5UI');

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

