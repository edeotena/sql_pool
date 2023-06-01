WITH visited AS
(SELECT pz.name pizzeria_name 
 FROM pizzeria pz
 JOIN person_visits pv ON pv.pizzeria_id = pz.id
 JOIN (SELECT person.id FROM person WHERE person.name = 'Andrey') p ON
	 pv.person_id = p.id
), ordered AS 
(SELECT pz.name pizzeria_name 
 FROM pizzeria pz
 JOIN menu m ON m.pizzeria_id = pz.id
 JOIN person_order po ON po.menu_id = m.id
 JOIN (SELECT person.id FROM person WHERE person.name = 'Andrey') p ON
	  po.person_id = p.id
)
SELECT * FROM visited
EXCEPT
SELECT * FROM ordered
ORDER BY pizzeria_name