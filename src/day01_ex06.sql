SELECT action.action_date, person.name AS person_name
FROM person,
    ((SELECT o.order_date action_date, o.person_id
     FROM person_order o)
    INTERSECT
    (SELECT v.visit_date action_date, v.person_id
     FROM person_visits v)) AS action
WHERE person.id = action.person_id
ORDER BY action.action_date ASC, person_name DESC;
