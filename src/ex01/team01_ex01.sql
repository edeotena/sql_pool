-- insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
-- insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

WITH balance_id AS (
	SELECT ROW_NUMBER() OVER() balance_id, updated, currency_id, user_id, money
	FROM balance
), cross_balance_currency AS (
	((SELECT c.rate_to_usd, c.name, balance_id--, b.updated - c.updated diff
	FROM balance_id b
	RIGHT JOIN currency c ON b.currency_id = c.id
	WHERE c.updated <= b.updated
	ORDER BY b.updated - c.updated)
	UNION ALL
	(SELECT c.rate_to_usd, c.name, balance_id--, c.updated - b.updated diff
	FROM balance_id b
	RIGHT JOIN currency c ON b.currency_id = c.id
	WHERE c.updated > b.updated
	ORDER BY c.updated - b.updated))
), balance_currency_with_id AS (
	SELECT ROW_NUMBER() OVER() record_id, *
	FROM cross_balance_currency
), balance_currency AS (
	SELECT DISTINCT ON (balance_id) balance_id, rate_to_usd, name
	FROM balance_currency_with_id
	ORDER BY balance_id, record_id
), actual_records AS (
	SELECT COALESCE (u.name, 'not defined') name,
		   COALESCE (u.lastname, 'not defined') lastname,
		   b.money,
		   b.balance_id
	FROM balance_id b
	LEFT JOIN "user" u ON b.user_id = u.id
)
SELECT actual_records.name,
	   actual_records.lastname,
	   balance_currency.name currency_name,
	   (actual_records.money * balance_currency.rate_to_usd) currency_in_usd
FROM actual_records
JOIN balance_currency ON balance_currency.balance_id = actual_records.balance_id
ORDER BY name DESC, lastname ASC, currency_name ASC;