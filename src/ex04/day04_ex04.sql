CREATE VIEW v_symmetric_union  AS
WITH second AS 
(
	SELECT id
	FROM person_visits
	WHERE visit_date = '2022-01-02'
), sixth AS
(
	SELECT id
	FROM person_visits
	WHERE visit_date = '2022-01-06'
)
(SELECT id
 FROM second
 EXCEPT
 SELECT id
 FROM sixth)
UNION
(SELECT id
 FROM sixth
 EXCEPT
 SELECT id
 FROM second);
 
 --SELECT * FROM v_symmetric_union;