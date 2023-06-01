WITH pizzeria_gender AS 
	(SELECT pz.id pizzeria_id, p.gender
	 FROM person_order po
	 JOIN menu m ON po.menu_id = m.id
	 RIGHT JOIN pizzeria pz ON m.pizzeria_id = pz.id
	 LEFT JOIN person p ON p.id = po.person_id
	), pizzeria_female AS
	(SELECT pizzeria_gender.pizzeria_id,
			COUNT(CASE WHEN gender = 'female' THEN 1 ELSE NULL END) count
	 FROM pizzeria_gender
	 GROUP BY pizzeria_gender.pizzeria_id
	), pizzeria_male AS
	(SELECT pizzeria_gender.pizzeria_id,
			COUNT(CASE WHEN gender = 'male' THEN 1 ELSE NULL END) count
	 FROM pizzeria_gender
	 GROUP BY pizzeria_gender.pizzeria_id
	)

SELECT pz.name pizzeria_name
FROM pizzeria pz
JOIN pizzeria_male ON pz.id = pizzeria_male.pizzeria_id AND
					  pizzeria_male.count = 0
JOIN pizzeria_female ON pz.id = pizzeria_female.pizzeria_id AND
					  pizzeria_female.count <> 0
UNION
SELECT pz.name pizzeria_name
FROM pizzeria pz
JOIN pizzeria_female ON pz.id = pizzeria_female.pizzeria_id AND
					  pizzeria_female.count = 0
JOIN pizzeria_male ON pz.id = pizzeria_male.pizzeria_id AND
					  pizzeria_male.count <> 0
ORDER BY pizzeria_name;