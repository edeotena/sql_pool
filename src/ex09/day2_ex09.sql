WITH female_orders AS 
	(SELECT DISTINCT p.name, m.pizza_name
	 FROM person p
	 JOIN person_order po ON po.person_id = p.id
	 JOIN menu m ON po.menu_id = m.id
	 WHERE p.gender = 'female'
	)
(SELECT female_orders.name
FROM female_orders
WHERE female_orders.pizza_name = 'pepperoni pizza')
INTERSECT
(SELECT female_orders.name
FROM female_orders
WHERE female_orders.pizza_name = 'cheese pizza')
ORDER BY name;
