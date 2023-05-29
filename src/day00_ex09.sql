SELECT p.name AS person_name, pz.name AS pizzeria_name
FROM person AS p, pizzeria AS pz,
	(SELECT person_id, pizzeria_id 
	 FROM person_visits
	 WHERE visit_date BETWEEN '2022-01-07' AND '2022-01-09'
	) AS pv
WHERE pv.person_id = p.id AND pizzeria_id = pz.id
ORDER BY person_name ASC, pizzeria_name DESC;