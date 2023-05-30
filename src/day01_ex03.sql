SELECT action.action_date, name AS person_name
FROM
((SELECT order_date AS action_date, person_id AS person_id
FROM person_order)
INTERSECT
(SELECT order_date AS action_date, person_id AS person_id
FROM person_order)) AS action, person
WHERE person.id = action.person_id
ORDER BY action_date ASC, person_name DESC;