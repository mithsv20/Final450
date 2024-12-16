
CREATE TABLE logins (
    user_id INT,
    login_date DATE
);

INSERT INTO logins (user_id, login_date)
VALUES
    (1, '2023-11-05'),
    (2, '2024-01-10'),
    (3, '2023-11-20'),
    (4, '2024-01-15'),
    (2, '2023-11-30'),
    (5, '2024-01-25');

--Write a query to find which user logged in during january 2024 but did not login in november 2023

SELECT distinct(user_id) FROM logins
WHERE user_id not in
  (SELECT distinct(user_id) FROM logins
  WHERE date_format(login_date, '%Y-%m') = '2023-11')
AND date_format(login_date, '%Y-%m') = '2024-01';

