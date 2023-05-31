SELECT p.name person_name, m.pizza_name pizza_name, pz.name pizzeria_name
FROM person p
JOIN person_order po ON p.id = po.person_id
JOIN menu m ON m.id = menu_id
JOIN pizzeria pz ON pz.id = m.pizzeria_id
ORDER BY person_name, pizza_name, pizzeria_name;