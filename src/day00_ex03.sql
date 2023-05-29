SELECT DISTINCT p.id
FROM person AS p, person_visits AS pv
WHERE pv.person_id = p.id AND
	  (pv.pizzeria_id = 2 OR pv.visit_date BETWEEN '2022-01-06' 
	  AND '2022-01-09')
ORDER BY p.id DESC;