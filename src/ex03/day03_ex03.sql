WITH pizzeria_statistic AS
	(SELECT pizzeria_person.pizzeria_id,
		COUNT(CASE pizzeria_person.gender
			  WHEN 'female'
			  THEN 1
			  ELSE NULL
			  END) female_count,
		COUNT(CASE pizzeria_person.gender 
			  WHEN 'male'
			  THEN 1 
			  ELSE NULL
			  END) male_count
	FROM (SELECT pz.id pizzeria_id, p.gender
		  FROM pizzeria pz
		  LEFT JOIN person_visits pv ON pz.id = pv.pizzeria_id
		  LEFT JOIN person p ON p.id = pv.person_id) pizzeria_person
	GROUP BY pizzeria_person.pizzeria_id)
	
SELECT pz.name pizzeria_name
FROM pizzeria pz
JOIN pizzeria_statistic ON pz.id = pizzeria_statistic.pizzeria_id
WHERE pizzeria_statistic.female_count <> pizzeria_statistic.male_count
ORDER BY pizzeria_name;