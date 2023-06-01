INSERT INTO menu (id, pizzeria_id, price, pizza_name)
VALUES (
	(SELECT MAX(id) 
	FROM menu) + 1,
	(SELECT id
	FROM pizzeria
	WHERE name = 'Dominos'),
	900,
	'sicilian pizza'
);

--SELECT * FROM menu;