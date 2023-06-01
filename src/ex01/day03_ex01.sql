SELECT m.id menu_id
FROM menu m
EXCEPT
SELECT m.id
FROM menu m, person_order po
WHERE m.id = po.menu_id
ORDER BY menu_id;