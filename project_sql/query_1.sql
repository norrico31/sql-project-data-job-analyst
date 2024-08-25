/*
 Question: What are the top-paying data analyst jobs?
 - Identify the top 10 highest-paying Data Analyst roles that are available remotely
 - Focuses on job postings with specified salaries (remove nulls)
 - BONUS: Include company names of top 10 roles
 - Why? Highlight the top-paying opportunities for Data Analysts, offering insights into employment options and location flexibility.
 */
SELECT job_id,
	job_title,
	job_location,
	job_schedule_type,
	salary_year_avg,
	job_posted_date,
	job_postings_fact.company_id,
	company.name company
FROM job_postings_fact
	LEFT JOIN company_dim AS company ON company.company_id = job_postings_fact.company_id
WHERE job_title_short = 'Data Analyst'
	AND job_location = 'Anywhere'
	And salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10