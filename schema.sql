-- Tables resulting from ETL transform
CREATE TABLE outbreaks (
  id INT PRIMARY KEY,
  year TEXT,
  month INT,
  State TEXT,
  Mode TEXT,
  Etiology TEXT,
  animal_type TEXT
);
