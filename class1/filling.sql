--Script fills created tables with data.
-- dbo can be replaced according to the db name.
-- due to the maintance of our VM  - dbo is my local instance.

INSERT INTO [dbo].[tavern] (name, location, floor_count)
VALUES
('"Prancing pony"', 'Bree', 3),
('"Forsaken Inn"', 'Bree',  2),
('"The Ivy Bush"', 'The Shire',  3),
('"Forlongs Hall"', 'Arnach',  5),
('"The Golden Perch"', 'Stock',  4);

INSERT INTO [dbo].[user] (tavern_id, name, role, role_description)
VALUES
(1,'Barliman Butterbur', 'owner',  'the owner of the tavern'),
(2, 'Barliman Butterbur','owner', 'got tavern from mother'),
(3, 'Carlo Blagrove','owner' ,'leads a small tavern'),
(4, 'Forlong the Fat','owner','loves to lead a tavern');

INSERT INTO [dbo].[supply] (unit, name)
VALUES
('kg', 'cheese'),
('ounce', 'red wine'),
('loaf', 'bread'),
('kg', 'onions'),
('ounce', 'strong ale');

INSERT INTO [dbo].[service_status] (status)  VALUES
('active'),
('inactive'),
('out of stock'),
('discontinued');


INSERT INTO [dbo].[service] (name, status_id, tavern_id) VALUES
('serving wine', 2, 1),
('fixing armor', 1, 2),
('sharpening weapon', 3, 3),
('bowling', 4, 1);

INSERT INTO [dbo].[sales] (service_id, tavern_id, guest, price, date_purchased) VALUES
(1, 2, 'Mr. Gandalf', '2000', '20191001'),
(3, 2, 'Old monk with a stick', '300', '20190802'),
(3, 1, 'Bearded Dwarf', '4000', '20190303'),
(3, 8, 'Little hobbit', '2150', '20190405');

INSERT  INTO [dbo].[receivement] (supply_id, tavern_id, cost, amount, date) VALUES
(5, 2, '20000', '11', '20181011'),
(4, 3, '30000', '14', '20181111'),
(3, 4, '40000', '15', '20181211'),
(2, 5, '50000', '16', '20180202');

INSERT INTO [dbo].[rat] (name, floor_number) VALUES
('Barry', 2),
('Adora', 3),
('Basia', 1),
('Culver', 4),
('Darrin', 5);

INSERT INTO [dbo].[floor] (floor_number) VALUES
(1),
(2),
(3),
(4),
(5),
(6);

INSERT INTO [dbo].[counts] (supply_id, tavern_id, date, current_count) VALUES
(1,2,'20190101',450),
(2,3,'20190201',350),
(4,3,'20190301',550),
(4,5,'20190401',650);