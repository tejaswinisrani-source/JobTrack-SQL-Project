-- JobTrack practice queries
USE jobtrack;

-- 1. Show all job applications
SELECT * FROM applications;

-- 2. Show applications newest first
SELECT application_id, job_role, application_date, application_status
FROM applications
ORDER BY application_date DESC;

-- 3. Show applications with company names (JOIN)
SELECT
    a.application_id,
    c.company_name,
    a.job_role,
    a.application_date,
    a.application_status,
    a.follow_up_date
FROM applications AS a
JOIN companies AS c
    ON a.company_id = c.company_id
ORDER BY a.application_date DESC;

-- 4. Count applications by status (GROUP BY)
SELECT application_status, COUNT(*) AS total
FROM applications
GROUP BY application_status
ORDER BY total DESC;

-- 5. Find applications that need follow-up today or earlier
SELECT c.company_name, a.job_role, a.follow_up_date, a.application_status
FROM applications AS a
JOIN companies AS c
    ON a.company_id = c.company_id
WHERE a.follow_up_date <= CURDATE()
  AND a.follow_up_date IS NOT NULL
  AND a.application_status NOT IN ('Offer', 'Rejected')
ORDER BY a.follow_up_date;

-- 6. Find applications that are still in progress
SELECT c.company_name, a.job_role, a.application_status
FROM applications AS a
JOIN companies AS c
    ON a.company_id = c.company_id
WHERE a.application_status IN ('Applied', 'Assessment', 'Interview');

-- 7. Update a status (example only; change the application_id if needed)
-- UPDATE applications
-- SET application_status = 'Interview'
-- WHERE application_id = 1;

-- 8. Add a new application (example; replace values with your own)
-- INSERT INTO applications
-- (company_id, job_role, application_date, application_status, follow_up_date, notes)
-- VALUES (1, 'Data Analyst Intern', CURDATE(), 'Applied', DATE_ADD(CURDATE(), INTERVAL 7 DAY), 'Added for practice');
