SELECT m.pizza_name, m.price, pz.name pizzeria_name
FROM menu m
JOIN pizzeria pz ON pz.id = m.pizzeria_id
WHERE m.id IN
	(SELECT m.id
	FROM menu m
	EXCEPT
	SELECT m.id
	FROM menu m, person_order po
	WHERE m.id = po.menu_id)
ORDER BY m.pizza_name, m.price;