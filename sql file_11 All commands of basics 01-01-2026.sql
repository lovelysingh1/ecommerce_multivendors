show databases;

use house;

show tables;

desc monthly_spends;

select*from monthly_spends;

create table monthly_spends (id INT AUTO_INCREMENT primary key,
 month_name varchar(20), 
 category varchar(50),
 amount decimal(10,2),
 note text);
 
 INSERT INTO monthly_spends (month_name, category, amount, note)
VALUES 
('January', 'Rent', 8000.00, 'House rent'),
('January', 'Electricity', 1200.50, 'Electric bill'),
('January', 'Groceries', 4500.00, 'Monthly ration'),
('January', 'Rent', 8000.00, 'House rent'),
('January', 'Electricity', 1200.50, 'Electric bill'),
('January', 'Groceries', 4500.00, 'Monthly ration'),
('February', 'Rent', 8000.00, 'House rent'),
('February', 'Electricity', 1300.00, 'Electric bill'),
('February', 'Groceries', 4200.00, 'Monthly ration'),
('March', 'Rent', 8000.00, 'House rent'),
('March', 'Electricity', 1100.00, 'Electric bill'),
('March', 'Groceries', 4600.00, 'Monthly ration');


INSERT INTO monthly_spends (month_name, category, amount, note)
SELECT 
    CASE FLOOR(RAND()*12)+1
        WHEN 1 THEN 'January'
        WHEN 2 THEN 'February'
        WHEN 3 THEN 'March'
        WHEN 4 THEN 'April'
        WHEN 5 THEN 'May'
        WHEN 6 THEN 'June'
        WHEN 7 THEN 'July'
        WHEN 8 THEN 'August'
        WHEN 9 THEN 'September'
        WHEN 10 THEN 'October'
        WHEN 11 THEN 'November'
        ELSE 'December'
    END AS month_name,
    'Groceries' AS category,
    FLOOR(RAND()*5000)+1000 AS amount,
    'Auto generated data' AS note;
    
    INSERT INTO monthly_spends (month_name, category, amount, note)
VALUES
('January', 'Rent', 8000.00, 'House rent'),
('January', 'Electricity', 1200.50, 'Electric bill'),
('January', 'Groceries', 4500.00, 'Monthly ration'),
('January', 'School Fees', 3000.00, 'Kids school fees'),
('January', 'Water Bill', 600.00, 'Water charges'),
('January', 'Internet', 999.00, 'WiFi plan'),
('January', 'Gas', 850.00, 'Cooking gas'),
('January', 'Maintenance', 500.00, 'Society charges'),

('February', 'Rent', 8000.00, 'House rent'),
('February', 'Electricity', 1300.00, 'Electric bill'),
('February', 'Groceries', 4200.00, 'Monthly ration'),
('February', 'School Fees', 3000.00, 'Kids school fees'),
('February', 'Water Bill', 650.00, 'Water charges'),
('February', 'Internet', 999.00, 'WiFi plan'),
('February', 'Gas', 900.00, 'Cooking gas'),
('February', 'Maintenance', 500.00, 'Society charges'),

('March', 'Rent', 8000.00, 'House rent'),
('March', 'Electricity', 1100.00, 'Electric bill'),
('March', 'Groceries', 4600.00, 'Monthly ration'),
('March', 'School Fees', 3000.00, 'Kids school fees'),
('March', 'Water Bill', 620.00, 'Water charges'),
('March', 'Internet', 999.00, 'WiFi plan'),
('March', 'Gas', 870.00, 'Cooking gas'),
('March', 'Maintenance', 500.00, 'Society charges'),

('April', 'Rent', 8000.00, 'House rent'),
('April', 'Electricity', 1250.00, 'Electric bill'),
('April', 'Groceries', 4400.00, 'Monthly ration'),
('April', 'School Fees', 3000.00, 'Kids school fees'),
('April', 'Water Bill', 600.00, 'Water charges'),
('April', 'Internet', 999.00, 'WiFi plan'),
('April', 'Gas', 880.00, 'Cooking gas'),
('April', 'Maintenance', 500.00, 'Society charges'),

('December', 'Rent', 8000.00, 'House rent'),
('December', 'Electricity', 1400.00, 'Electric bill'),
('December', 'Groceries', 4700.00, 'Monthly ration'),
('December', 'School Fees', 3000.00, 'Kids school fees'),
('December', 'Water Bill', 700.00, 'Water charges'),
('December', 'Internet', 999.00, 'WiFi plan'),
('December', 'Gas', 950.00, 'Cooking gas'),
('December', 'Maintenance', 500.00, 'Society charges'),

('December', 'Miscellaneous', 2000.00, 'Festival expenses'),
('December', 'Miscellaneous', 1500.00, 'Travel expenses'),
('December', 'Miscellaneous', 1000.00, 'Medical expenses'),
('December', 'Miscellaneous', 800.00, 'Other expenses');

INSERT INTO monthly_spends (month_name, category, amount, note)
VALUES
('May', 'Rent', 8000.00, 'House rent'),
('May', 'Electricity', 1350.00, 'Electric bill'),
('May', 'Groceries', 4300.00, 'Monthly ration'),
('May', 'School Fees', 3000.00, 'Kids school fees'),
('May', 'Water Bill', 640.00, 'Water charges'),
('May', 'Internet', 999.00, 'WiFi plan'),
('May', 'Gas', 890.00, 'Cooking gas'),
('May', 'Maintenance', 500.00, 'Society charges'),

('June', 'Rent', 8000.00, 'House rent'),
('June', 'Electricity', 1200.00, 'Electric bill'),
('June', 'Groceries', 4100.00, 'Monthly ration'),
('June', 'School Fees', 3000.00, 'Kids school fees'),
('June', 'Water Bill', 650.00, 'Water charges'),
('June', 'Internet', 999.00, 'WiFi plan'),
('June', 'Gas', 880.00, 'Cooking gas'),
('June', 'Maintenance', 500.00, 'Society charges'),

('July', 'Rent', 8000.00, 'House rent'),
('July', 'Electricity', 1400.00, 'Electric bill'),
('July', 'Groceries', 4700.00, 'Monthly ration'),
('July', 'School Fees', 3000.00, 'Kids school fees'),
('July', 'Water Bill', 700.00, 'Water charges'),
('July', 'Internet', 999.00, 'WiFi plan'),
('July', 'Gas', 950.00, 'Cooking gas'),
('July', 'Maintenance', 500.00, 'Society charges'),

('August', 'Rent', 8000.00, 'House rent'),
('August', 'Electricity', 1250.00, 'Electric bill'),
('August', 'Groceries', 4400.00, 'Monthly ration'),
('August', 'School Fees', 3000.00, 'Kids school fees'),
('August', 'Water Bill', 680.00, 'Water charges'),
('August', 'Internet', 999.00, 'WiFi plan'),
('August', 'Gas', 920.00, 'Cooking gas'),
('August', 'Maintenance', 500.00, 'Society charges');

select category, note, amount from
 monthly_spends;
 
 START TRANSACTION;
 
 select * from monthly_spends where category = 'Rent';
 
 





