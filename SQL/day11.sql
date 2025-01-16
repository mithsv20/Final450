create table brands
(
    Year    int,
    Brand   varchar(20),
    Amount  int
);
insert into brands values (2018, 'Apple', 45000);
insert into brands values (2019, 'Apple', 35000);
insert into brands values (2020, 'Apple', 75000);
insert into brands values (2018, 'Samsung',	15000);
insert into brands values (2019, 'Samsung',	20000);
insert into brands values (2020, 'Samsung',	25000);
insert into brands values (2018, 'Nokia', 21000);
insert into brands values (2019, 'Nokia', 17000);
insert into brands values (2020, 'Nokia', 14000);

select distinct Brand from brands where Brand not in
(select distinct a1.Brand
from brands a1 left join brands a2 
on a1.Brand = a2.Brand and a1.Year = a2.Year - 1
where a1.Amount > a2.Amount)
