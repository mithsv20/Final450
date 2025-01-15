-- Create Table
CREATE TABLE EMPLOYEE_STATUS (
    EMPLOYEE VARCHAR(10) NOT NULL,
    DATES DATE NOT NULL,
    STATUS VARCHAR(10) NOT NULL
);

-- Insert Data
INSERT INTO EMPLOYEE_STATUS (EMPLOYEE, DATES, STATUS) VALUES
('A1', '2024-01-01', 'PRESENT'),
('A1', '2024-01-02', 'PRESENT'),
('A1', '2024-01-03', 'PRESENT'),
('A1', '2024-01-04', 'ABSENT'),
('A1', '2024-01-05', 'PRESENT'),
('A1', '2024-01-06', 'PRESENT'),
('A1', '2024-01-07', 'ABSENT'),
('A1', '2024-01-08', 'ABSENT'),
('A1', '2024-01-09', 'ABSENT'),
('A1', '2024-01-10', 'PRESENT'),
('A2', '2024-01-06', 'PRESENT'),
('A2', '2024-01-07', 'PRESENT'),
('A2', '2024-01-08', 'ABSENT'),
('A2', '2024-01-09', 'PRESENT'),
('A2', '2024-01-10', 'ABSENT');

-- query

-- select *, CASE WHEN  from 
-- (select *, LEAD(STATUS) OVER(partition by EMPLOYEE ORDER BY DATES) as next_status from EMPLOYEE_STATUS)
WITH CTE AS 
    (select *, row_number() over(partition by EMPLOYEE order by EMPLOYEE, DATES) as r_n 
    from EMPLOYEE_STATUS),
  PRESENT_TABLE AS 
    (select *, r_n - row_number() over(partition by EMPLOYEE order by EMPLOYEE, DATES) as rn2
    from CTE WHERE STATUS = 'PRESENT'),
  ABSENT_TABLE AS 
    (select *, r_n - row_number() over(partition by EMPLOYEE order by EMPLOYEE, DATES) as rn2
    from CTE WHERE STATUS = 'ABSENT'),
  COMPLETE_TABLE AS 
    (
    select * from PRESENT_TABLE union
    select * from ABSENT_TABLE
    )
  
select EMPLOYEE, min(DATES) as from_dates, max(DATES) as to_dates, status
from COMPLETE_TABLE
group by EMPLOYEE,status, rn2
order by EMPLOYEE, from_dates
