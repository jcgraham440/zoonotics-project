-- Tables resulting from ETL transform
CREATE TABLE us_outbreaks (
  id INT PRIMARY KEY,
  year TEXT,
  month INT,
  State TEXT,
  Mode TEXT,
  Etiology TEXT,
  animal_type TEXT
);

CREATE TABLE global_outbreaks (
  id INT PRIMARY KEY,
  year TEXT,
  disease_agent varchar,
  reported_cases_angola varchar,
  reported_cases_australia varchar,
  reported_cases_benin varchar,
  reported_cases_brazil varchar,
  reported_cases_burkina_faso varchar,
  reported_cases_cameroon varchar,
  reported_cases_central_african_republic varchar,
  reported_cases_china varchar,
  reported_cases_congo varchar,
  reported_cases_cote_d_lvoire varchar,
  reported_cases_democratic_republic_of_the_congo varchar,
  reported_cases_equatorial guinea varchar,
  reported_cases_gabon varchar,
  reported_cases_ghana varchar,
  reported_cases_guinea varchar,
  reported_cases_indonesia varchar,
  reported_cases_japan varchar,
  reported_cases_kenya varchar,
  reported_cases_kirbati varchar,
  reported_cases_malawi varchar,
  reported_cases_malasia varchar,
  reported_cases_mexico varchar,
  reported_cases_nigeria varchar,
  reported_cases_papua_new_guinea varchar,
  reported_cases_peru varchar,
  reported_cases_senegal varchar,
  reported_cases_sierra_leone varchar,
  reported_cases_south_sudan varchar,
  reported_cases_sri_lanka varchar,
  reported_cases_suriname varchar,
  reported_cases_togo varchar
  reported_cases_uganda varchar
);

