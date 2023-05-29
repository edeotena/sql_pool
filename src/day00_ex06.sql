SELECT p.name, p.name = 'Denis' as check_name
FROM
    (SELECT po.person_id
	 FROM person_order AS po
	 WHERE (po.menu_id = 13 OR po.menu_id = 14 OR po.menu_id = 18) AND
	 po.order_date = '2022-01-07'
	) AS ids, person AS p
WHERE ids.person_id = p.id;
