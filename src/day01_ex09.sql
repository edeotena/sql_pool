SELECT pz.name
FROM pizzeria pz
WHERE pz.id NOT IN
	(SELECT DISTINCT pv.pizzeria_id
	FROM person_visits pv);

SELECT pz.name
FROM pizzeria pz
WHERE NOT EXISTS (SELECT *
				  FROM person_visits pv
				  WHERE pv.pizzeria_id = pz.id);