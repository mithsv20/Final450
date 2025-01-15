CREATE TABLE ipl_teams (
    TeamId INT PRIMARY KEY,
    TeamName VARCHAR(50)
);

INSERT INTO ipl_teams (TeamId, TeamName) VALUES
(1, 'Mumbai Indians'),
(2, 'Chennai Super Kings'),
(3, 'Kolkata Knight Riders'),
(4, 'Royal Challengers Bangalore'),
(5, 'Delhi Capitals'),
(6, 'Sunrisers Hyderabad'),
(7, 'Rajasthan Royals'),
(8, 'Punjab Kings'),
(9, 'Lucknow Super Giants'),
(10, 'Gujarat Titans');

-- select t1.teamname as team1, t2.teamname as team2 
-- from ipl_teams t1 join ipl_teams t2 on t1.teamname != t2.teamname;


with CTE as (select row_number() over(order by teamname) as r_n, teamname
from ipl_teams)

select
t1.teamname as team1, t2.teamname as team2 
from
CTE t1
join
CTE t2
on t1.r_n > t2.r_n
