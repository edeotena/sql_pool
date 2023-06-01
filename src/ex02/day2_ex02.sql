SELECT COALESCE(person.name, '-') person_name,
	   visits.visit_date, 
	   COALESCE(pizzeria.name, '-') pizzeria_name
FROM (SELECT *
			 FROM person_visits pv
			 WHERE visit_date BETWEEN '2022-01-01' 
	         AND '2022-01-03') visits
RIGHT JOIN person ON person.id = visits.person_id
FULL JOIN pizzeria ON pizzeria.id = visits.pizzeria_id
ORDER BY person_name, visit_date, pizzeria_name;