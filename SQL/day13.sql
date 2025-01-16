CREATE TABLE user_activity (
    username character varying(50),
    activity character varying(50),
    startdate date,
    enddate date
);

INSERT INTO user_activity (username, activity, startdate, enddate) VALUES
('Amy', 'Travel', '2020-02-12', '2020-02-20'),
('Amy', 'Dancing', '2020-02-21', '2020-02-23'),
('Amy', 'Travel', '2020-02-24', '2020-02-28'),
('Joe', 'Travel', '2020-02-11', '2020-02-18'),
('Adam', 'Travel', '2020-02-12', '2020-02-20'),
('Adam', 'Dancing', '2020-02-21', '2020-02-23'),
('Adam', 'Singing', '2020-02-24', '2020-02-28'),
('Adam', 'Travel', '2020-03-01', '2020-03-28'),
('Maira', 'Travel', '2020-02-12', '2020-02-20'),
('John', 'Dancing', '2020-02-21', '2020-02-23'),
('John', 'Singing', '2020-02-24', '2020-02-28'),
('John', 'Travel', '2020-03-01', '2020-03-28');


with cte as
(
  select *, 
  rank() over(partition by username order by enddate desc) as rnk,
  count(1) over(partition by username) as cnt
  from user_activity
)

select * 
from cte
where rnk = 2 or cnt = 1
