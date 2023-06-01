INSERT INTO person_order
SELECT (SELECT MAX(person_order.id)
		FROM person_order) + series.i id,
	    person.id person_id,
	   (SELECT id FROM menu
		WHERE pizza_name = 'greek pizza') menu_id,
	    '2022-02-25' order_date
FROM generate_series(1, (SELECT COUNT(*)
						 FROM person)) AS series(i)
JOIN person ON series.i = person.id;

--SELECT * FROM person_order;