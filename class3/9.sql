INSERT INTO tavern (owner, floor_count, name)
SELECT name, id, notes FROM guest;
