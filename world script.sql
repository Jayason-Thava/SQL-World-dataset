use world;

select * from city;
select * from country where name = "Spain";
select * from countrylanguage;

select count(*) from city where countryCode = "USA"; 

select name, LifeExpectancy from country order by LifeExpectancy desc;

select * from city where name like ("%New%");

select * from city order by population desc limit 10;

select * from city where population > 2000000;

select * from city where Name like("Be%");

select * from city where population between 500000 and 1000000;

select * from city order by Name asc;

select Name ,population from city order by population desc;

select distinct(city.Name),CountryCode from city order by city.Name asc;

select Name , population from city order by population limit 1;

select Name, population from country order by population desc limit 1;

select country.Name, city.Name from country inner join city on country.code = city.countrycode where country.Name = "Spain";

select city.Name from country inner join city on country.code= city.Countrycode where country.continent = "Europe";

select Name, avg(population) from country group by Name;

select * from country;
select * from city;
select country.Name as country,city.Name as city,city.population from country inner join city on country.Code = city.countrycode;

select Name, (population/ surfacearea) as "population density" from country order by (population/surfacearea) desc;

select city.name,(GNP/city.population) as GDP 
from country inner join city on country.code = city.countrycode
 order by (GNP/city.population) desc;
 
select c.name,  co.name, co.Population, (co.gnp/co.Population) as GDPperCapita
from city as c
inner join country as co
on c.CountryCode=co.Code
where (co.gnp/co.Population) > (select avg(gnp/Population) from country)
order by (co.gnp/co.Population) Desc;
 
select * from city order by population desc limit 10 offset 30;

select co.name,avg(ci.population)from city as ci
 join country as co
 on ci.countrycode = co.code
 group by co.name;
 
select avg(gnp*1000000/population) as gdp from country;

select ci.name, (co.gnp*1000000/co.population) as gdp
from country as co
join city as ci
on co.code = ci.countrycode
where  (co.gnp*1000000/co.population) > (select avg(gnp*1000000/population)from country);
