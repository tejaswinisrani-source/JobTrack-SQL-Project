-- JobTrack: Job Application Tracker
-- Beginner SQL project for MySQL Workbench

CREATE DATABASE IF NOT EXISTS jobtrack;
USE jobtrack;

CREATE TABLE IF NOT EXISTS companies (
    company_id INT AUTO_INCREMENT PRIMARY KEY,
    company_name VARCHAR(100) NOT NULL,
    location VARCHAR(100),
    website VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS applications (
    application_id INT AUTO_INCREMENT PRIMARY KEY,
    company_id INT NOT NULL,
    job_role VARCHAR(100) NOT NULL,
    application_date DATE NOT NULL,
    application_status ENUM(
        'Applied',
        'Assessment',
        'Interview',
        'Offer',
        'Rejected'
    ) NOT NULL DEFAULT 'Applied',
    follow_up_date DATE,
    notes VARCHAR(255),
    CONSTRAINT fk_applications_company
        FOREIGN KEY (company_id) REFERENCES companies(company_id)
);

-- Sample companies
INSERT INTO companies (company_name, location, website) VALUES
('Infosys', 'Bengaluru', 'https://www.infosys.com'),
('TCS', 'Bengaluru', 'https://www.tcs.com'),
('Accenture', 'Bengaluru', 'https://www.accenture.com'),
('Wipro', 'Bengaluru', 'https://www.wipro.com'),
('Capgemini', 'Bengaluru', 'https://www.capgemini.com');

-- Sample job applications
INSERT INTO applications
(company_id, job_role, application_date, application_status, follow_up_date, notes)
VALUES
(1, 'Python Developer', '2026-10-20', 'Applied', '2026-11-03', 'Fresher role'),
(2, 'Graduate Engineer Trainee', '2026-10-21', 'Assessment', '2026-10-30', 'Prepare aptitude'),
(3, 'Associate Software Engineer', '2026-10-22', 'Interview', '2026-10-31', 'Revise Python and SQL'),
(4, 'Junior Developer', '2026-10-23', 'Rejected', NULL, 'Keep applying'),
(5, 'Software Engineer Trainee', '2026-10-24', 'Applied', '2026-11-05', 'Check application portal');

-- Verify the data
SELECT * FROM companies;
SELECT * FROM applications;
