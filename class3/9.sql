INSERT INTO tavern (owner, floor_count, name)
SELECT name, id, notes FROM guest;

--SELECT CONCAT(RNDCOL_name, ' ', DATA_TYPE, 'hola', TABLE_SCHEMA), * 
--FROM INFORMATION_SCHEMA.COLOMNS WHERE TABLE NAME = 'Taverns';
