-- PROJECT-1 - JOB MARKET SALARY ANALYSIS


-- COUNTING NUMBER OF JOBS PER ROLE
SELECT job_title_short, COUNT(*)
FROM jobs
GROUP BY job_title_short

-- AVERAGE SALARY PER ROLE
SELECT job_title_short, ROUND(AVG(salary_year_avg), 2) AS avg_salary_per_role
FROM jobs
GROUP BY job_title_short

-- SALARY BY EXPERIENCE LEVEL
SELECT 
ROUND(AVG(salary_year_avg),2) AS avg_salary_by_exp, experience_level
FROM jobs
GROUP BY experience_level
ORDER BY experience_level

-- TOP PAYING LOCATIONS
SELECT job_location, ROUND(AVG(salary_year_avg),2) AS avg_sal_by_loc
FROM jobs
GROUP BY job_location
ORDER BY avg_sal_by_loc DESC

-- AVERAGE SALARY ACCORDING TO WORK TYPE
SELECT
CASE
WHEN remote_ratio = 100 THEN 'REMOTE'
WHEN remote_ratio = 50 THEN 'HYBRID'
ELSE 'ON-SITE'
END AS Work_type,
ROUND(AVG(salary_year_avg),2) AS avg_salary
FROM jobs
GROUP BY Work_type
ORDER BY avg_salary DESC