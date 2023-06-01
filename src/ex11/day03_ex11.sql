UPDATE menu
SET price = 0.9 * price
WHERE id = (SELECT id
			FROM menu
			WHERE pizza_name = 'greek pizza');

--SELECT * FROM menu;