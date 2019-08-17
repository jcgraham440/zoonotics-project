

CREATE TABLE us_outbreaks (

  ID_ INT PRIMARY KEY,
  Year Text, 
  Month Text,
  State TEXT,
  Mode TEXT,
  Etiology TEXT,
  Animal_type TEXT
);
select * from us_outbreaks


CREATE TABLE global_outbreaks (
  Id_ Int PRIMARY KEY,
  Year Int,	
  Country TEXT,
  Number_cases TEXT,
  Infectious_Disease TEXT);

Select * from global_outbreaks

