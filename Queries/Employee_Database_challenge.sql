-- Module 7 Challenge
-- Employees Table Columns
SELECT emp_no, first_name, last_name FROM employees;

-- Titles Table Columns
SELECT title, from_date, to_date FROM titles;

-- Creating a new table called retirement_titles and exporting to csv
SELECT e.emp_no,
		e.first_name,
		e.last_name,
		tt.title,
		tt.from_date,
		tt.to_date
INTO retirement_titles
FROM employees AS e
	INNER JOIN titles as tt
		ON (e.emp_no = tt.emp_no)
		WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
		ORDER BY e.emp_no;
		
SELECT * FROM retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows
DROP TABLE unique_retirement_titles;
Select emp_no, first_name, last_name, title from retirement_titles;
Select * from retirement_titles;

SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title

INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

SELECT * FROM unique_titles;

-- retrieving the number of titles from the unique titles table
SELECT COUNT(ut.title), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY count DESC;

Select * FROM retiring_titles;


-- Deliverable 2 of Module 7 Challenge

SELECT emp_no, first_name, last_name,birth_date FROM employees;
SELECT * FROM employees;
SELECT from_date, to_date FROM dept_emp;
SELECT * FROM dept_emp;
SELECT title from titles;
SELECT * from titles;

DROP TABLE mentorship_eligibility;
SELECT DISTINCT ON (e.emp_no) e.emp_no,
		e.first_name,
		e.last_name,
		e.birth_date,
		de.from_date,
		de.to_date,
		tt.title
INTO mentorship_eligibility
FROM employees  AS e
	INNER JOIN dept_emp AS de
		ON (e.emp_no = de.emp_no)
	INNER JOIN titles as tt
		ON (e.emp_no = tt.emp_no)
	WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31') AND (de.to_date = '9999-01-01')
	ORDER BY e.emp_no;

SELECT * FROM mentorship_eligibility;
