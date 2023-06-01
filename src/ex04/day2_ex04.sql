SELECT m.pizza_name, pz.name pizzeria_name, m.price
FROM menu m
JOIN pizzeria pz ON pz.id = m.pizzeria_id
WHERE m.pizza_name = 'mushroom pizza' OR m.pizza_name = 'pepperoni pizza'
ORDER BY pizza_name, pizzeria_name;
