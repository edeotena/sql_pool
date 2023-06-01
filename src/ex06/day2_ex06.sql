SELECT m.pizza_name, pz.name pizzeria_name
FROM menu m
JOIN pizzeria pz ON pz.id = m.pizzeria_id
JOIN person_order po ON m.id = po.menu_id
JOIN person p ON po.person_id = p.id
WHERE p.name = 'Denis' OR p.name = 'Anna'
ORDER BY pizza_name, pizzeria_name;