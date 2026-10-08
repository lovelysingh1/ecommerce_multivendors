insert into products (serial, name, price) value (1, 'ranjeet', 26000);
insert into products (serial, name, price) value (2, 'mobile', 81000);
insert into products (serial, name, price) value (3, 'charger cable', 250);
insert into products (serial, name, price) value (4, 'screen guard', 180);

insert into products (serial, name, price) value (5, 'mobile cover', 350), (6, 'watch', 850), (7, 'laptop screen', 2500), (8, 'keyboard', 1500), (9, 'mouse', 650), (10, 'cpu cabinet', 11000), (11, ' microsoftware', 450), (12, 'photoshop software', 15000), (13, 'anti virus', 4500), (14, 'power bank', 1000), (15, 'laptop connector', 3000);

-- DATA KO UPDATE KRNE K LIYE AND UPDATE KRENGE PRIMARY KEY K BASE pr

UPDATE products SET price = 12000 WHERE serial = 10;

-- Data ko delete krne k liye

DELETE FROM products WHERE serial = 15;