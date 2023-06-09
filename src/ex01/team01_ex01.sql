-- insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
-- insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

WITH balance_id AS (
	SELECT ROW_NUMBER() OVER() balance_id, *
	FROM balance
), cross_balance_currency AS (
	((SELECT *, b.updated - c.updated diff
	FROM balance_id b
	RIGHT JOIN currency c ON b.currency_id = c.id
	WHERE c.updated <= b.updated
	ORDER BY b.updated - c.updated)
	UNION ALL
	(SELECT *, c.updated - b.updated diff
	FROM balance_id b
	RIGHT JOIN currency c ON b.currency_id = c.id
	WHERE c.updated > b.updated
	ORDER BY c.updated - b.updated))
)
	SELECT *
	FROM cross_balance_currency

WITH actual_records AS (
SELECT COALESCE (u.name, 'not defined') name,
	   COALESCE (u.lastname, 'not defined') lastname,
	   b.updated,
	   b.money,
	   b.currency_id
FROM balance_id b
LEFT JOIN "user" u ON b.user_id = u.id
)
SELECT actual_records.name,
	   actual_records.lastname,
	   balance_currency.name currency_name,
	   (actual_records.money * balance_currency.rate_to_usd) currency_in_usd
FROM actual_records
JOIN balance_currency ON balance_currency.balance_id = actual_records.balance_id;


SELECT * FROM currency;
SELECT * FROM balance;
SELECT * FROM "user";