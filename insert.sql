INSERT INTO salesperson("first_name", "last_name") VALUES 
('Jeff', 'Bezos'),
('Bill', 'Gates'),
('Warren', 'Buffet'),
('Larry', 'Page'),
('Elon', 'Musk'),
('Tom', 'Hanks');

INSERT INTO invoice("date", "car_id", "customer_id", "salesperson_id") VALUES 
('2019-05-12', 1, 1, 1),
('2019-06-02', 6, 4, 3),
('2019-05-08', 3, 2, 2),
('2020-09-22', 4, 3, 5),
('2021-04-29', 2, 5, 6),
('2022-06-01', 5, 6, 4);

INSERT INTO mechanic("first_name", "last_name") VALUES 
('Jason', 'Statham'),
('Mario', 'Bros'),
('Luigi', 'Bros');


INSERT INTO "service"("service name", "price") VALUES 
('Full synthetic oil change', 59.95),
('Diesel engine - full synthetic oil change', 59.95),
('Tire rotation', 39.95),
('Battery replacement', 189.95),
('Four-wheel alignment', 99.95),
('Brake pad replacement', 199.95),
('Transmission fluid exchange', 289.95),
('Multi-point inspection', 00.00);

INSERT INTO "part"("description", "price") VALUES 
('Oil filter', 10.05),
('Brake pad', 30.50),
('Platinum AGM Auxiliary Battery', 200.00),
('Wheel Goodyear 17"', 500.00),
('Headlight bulb', 5.00);

UPDATE service_ticket
SET notes = 'Replace 4 tires'
WHERE service_ticket_id = 3