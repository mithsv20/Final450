create table src_dest_distance
(
    source          varchar(20),
    destination     varchar(20),
    distance        int
);
insert into src_dest_distance values ('Bangalore', 'Hyderbad', 400);
insert into src_dest_distance values ('Hyderbad', 'Bangalore', 400);
insert into src_dest_distance values ('Bangalore', 'Delhi', 400);
insert into src_dest_distance values ('Delhi', 'Bangalore', 400);
insert into src_dest_distance values ('Mumbai', 'Delhi', 400);
insert into src_dest_distance values ('Delhi', 'Mumbai', 400);
insert into src_dest_distance values ('Mumbai', 'Hyderbad', 400);
insert into src_dest_distance values ('Hyderbad', 'Mumbai', 400);
insert into src_dest_distance values ('Chennai', 'Pune', 400);
insert into src_dest_distance values ('Pune', 'Chennai', 400);


-- query 1
select 
distinct
LEAST(source, destination) as source,
GREATEST(source, destination) as destination,
distance
from src_dest_distance

-- query 2
with cte as (
      select *, row_number() over() as id from src_dest_distance
    )

select distinct t1.*
from
cte t1
join cte t2
on t1.source = t2.destination
and t1.id < t2.id 
and t2.source = t1.destination


