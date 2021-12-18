--Deliverable 1 - 
--Retrieve from employees table and titles tables. Join both tables on PK

SELECT e.emp_no,
		e.first_name,
		e.last_name,
		ti.title,
		ti.from_date,
		ti.to_date
INTO retirements_titles
FROM employees AS e
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER by e.emp_no;

SELECT * FROM retiring_titles



--Deliverable 2
--Use Distinct On 
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirements_titles
ORDER BY emp_no, to_date DESC;

--Count of retiring employees by title
SELECT COUNT (emp_no),
title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count(title) DESC;

--Mentorship Eligibility 
SELECT DISTINCT ON (emp_no) e.emp_no,
	   e.first_name,
	   e.last_name,
	   e.birth_date,
	   de.from_date,
	   de.to_date,
	   ti.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (de.to_date = '9999-01-01') 
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;


SELECT COUNT(emp_no), title
INTO mentoring_titles
FROM mentorship_eligibility
GROUP BY title
ORDER BY count(title) DESC;


SELECT * FROM mentorship_eligibility

SELECT * FROM mentoring_titles

