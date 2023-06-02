CREATE VIEW v_price_with_discount AS
SELECT p.name, m.pizza_name, m.price, ROUND(0.9 * m.price) discount_price
FROM person p
JOIN person_order po ON po.person_id = p.id
JOIN menu m ON po.menu_id = m.id
ORDER BY p.name, m.pizza_name;

--SELECT * FROM v_price_with_discount;