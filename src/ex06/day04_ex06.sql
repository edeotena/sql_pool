CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
SELECT DISTINCT pz.name pizzeria_name
FROM person_visits pv
JOIN pizzeria pz on pz.id = pv.pizzeria_id
JOIN person p on p.id = pv.person_id
JOIN menu m on pz.id = m.pizzeria_id
WHERE p.name = 'Dmitriy' AND 
	  pv.visit_date = '2022-01-08' AND
	  m.price < 800;

--SELECT * FROM mv_dmitriy_visits_and_eats;