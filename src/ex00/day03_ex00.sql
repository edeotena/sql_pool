SELECT m.pizza_name, m.price, pz.name pizzeria_name, pv.visit_date
FROM (SELECT id
	  FROM person
	  WHERE name = 'Kate') p
JOIN person_visits pv ON p.id = pv.person_id
JOIN pizzeria pz ON pz.id = pv.pizzeria_id
JOIN menu m ON m.pizzeria_id = pz.id AND
			   m.price BETWEEN 800 AND 1000
ORDER BY pizza_name, price, pizzeria_name;