SELECT person_name, visit_date, 
CASE 
	WHEN pspv.pizzeria_id IS NULL
	THEN '-'
	ELSE pz.name 
END pizzeria_name
FROM
	(SELECT p.name person_name, pv.visit_date, pv.pizzeria_id
	FROM  person p
	LEFT JOIN (SELECT * 
			   FROM person_visits 
			   WHERE visit_date BETWEEN '2022-01-01' 
			   AND '2022-01-03') pv
	ON p.id = pv.person_id) pspv
LEFT JOIN pizzeria pz ON pz.id = pspv.pizzeria_id
ORDER BY person_name, visit_date, pizzeria_name;
		   
