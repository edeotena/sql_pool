SELECT all_dates.date
FROM (SELECT 
	  CAST(('2022-01-' || generate_series(1, 10)) AS date)
	 ) all_dates
LEFT JOIN (SELECT visit_date
		   FROM person_visits 
		   WHERE person_id = 1 OR person_id = 2
		  ) visit_dates
ON visit_dates.visit_date = all_dates.date
WHERE visit_dates.visit_date IS NULL
ORDER BY all_dates.date ASC;
