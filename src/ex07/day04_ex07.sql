/*
INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
VALUES (
(SELECT MAX(id) + 1
 FROM person_visits),
(SELECT id
 FROM person
 WHERE name = 'Dmitriy'),
(SELECT pz.id
 FROM pizzeria pz
 JOIN menu m ON m.pizzeria_id = pz.id
 WHERE name <> 'Papa Johns'
 AND m.price < 800
 LIMIT 1),
 '2022-01-08'
)
*/

--SELECT * FROM person_visits

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;

--SELECT * FROM mv_dmitriy_visits_and_eats;