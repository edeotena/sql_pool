WITH all_dates AS 
(SELECT 
	CAST(('2022-01-' || generate_series(1, 10)) AS date)
),
visit_dates AS
(SELECT visit_date
	FROM person_visits 
	WHERE person_id = 1 OR person_id = 2
)
SELECT all_dates.date
FROM  all_dates
LEFT JOIN  visit_dates
ON visit_dates.visit_date = all_dates.date
WHERE visit_dates.visit_date IS NULL
ORDER BY all_dates.date ASC;
