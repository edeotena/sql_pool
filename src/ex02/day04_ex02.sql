CREATE VIEW v_generated_dates AS
SELECT CAST(('2022-01-' || generate_series(1, 31)) 
			AS date) generated_date
ORDER BY generated_date;

--SELECT * FROM v_generated_dates;