SELECT name || ' (age:' || age || E',gender:\'' || gender || E'\',address:\'' || address || E'\')' AS person_information
FROM person
ORDER BY person_information ASC;