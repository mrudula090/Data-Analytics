USE mental_health;

SELECT * FROM students;

-- Count the number of records in the table
SELECT COUNT(*) AS total_records 
FROM students;

-- Inspect the data and limit the output to 5 records
SELECT *
FROM students
LIMIT 5;

-- Count the number of international and domestic students
SELECT inter_dom, COUNT(inter_dom) AS count_inter_dom
FROM students
GROUP BY inter_dom;

-- Query the data to see all records where inter_dom is neither 'Dom' nor 'Inter'
SELECT *
FROM students
WHERE inter_dom NOT LIKE 'D%' AND inter_dom NOT LIKE 'I%';

-- See what Region international students are from
SELECT Region, COUNT(inter_dom) AS count_inter_dom
FROM students
WHERE inter_dom = 'Inter'
GROUP BY Region;

-- Find out the basic summary statistics of the diagnostic tests for all students
SELECT MIN(ToDep) AS min_phq, 
	   MAX(ToDep) AS max_phq, 
       ROUND(AVG(ToDep), 2) AS avg_phq, 
       MIN(ToSC) AS min_scs, 
       MAX(ToSC) AS max_scs, 
       ROUND(AVG(ToSC), 2) AS avg_scs, 
       MIN(ToAS) AS min_as, 
       MAX(ToAS) AS max_as, 
       ROUND(AVG(ToAS), 2) AS avg_as
FROM students;

-- Write a query that looks at the statistics of each student group on one table, remembering to avoid the empty rows
SELECT inter_dom,
	   MIN(ToDep) AS min_phq, 
	   MAX(ToDep) AS max_phq, 
       ROUND(AVG(ToDep), 2) AS avg_phq, 
       MIN(ToSC) AS min_scs, 
       MAX(ToSC) AS max_scs, 
       ROUND(AVG(ToSC), 2) AS avg_scs, 
       MIN(ToAS) AS min_as, 
       MAX(ToAS) AS max_as, 
       ROUND(AVG(ToAS), 2) AS avg_as
FROM students
WHERE inter_dom IN ('Inter', 'Dom')
GROUP BY inter_dom;

-- Find the average scores for each age group of international students, and view them in order
SELECT Age, 
       ROUND(AVG(ToDep), 2) AS avg_phq, 
       ROUND(AVG(ToSC), 2) AS avg_scs, 
       ROUND(AVG(ToAS), 2) AS avg_as
FROM students
WHERE inter_dom = 'Inter'
GROUP BY Age
ORDER BY Age;

-- Find the average scores by length of stay for international students, and view them in order
SELECT Stay, 
       ROUND(AVG(ToDep), 2) AS avg_phq, 
       ROUND(AVG(ToSC), 2) AS avg_scs, 
       ROUND(AVG(ToAS), 2) AS avg_as
FROM students
WHERE inter_dom = 'Inter'
GROUP BY Stay
ORDER BY Stay;




