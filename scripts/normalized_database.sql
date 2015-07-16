-- db denormal_cars
CREATE TABLE IF NOT EXISTS manufacture
(
	id serial NOT NULL, 
  make_code character varying(125) NOT NULL,
  name character varying(125) NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS year
(
	id serial NOT NULL,
  year character varying(4) NOT NULL,
  PRIMARY KEY (id)
); 


CREATE TABLE IF NOT EXISTS model_title
(
	id serial NOT NULL,
  name character varying(125) NOT NULL,
  model_code character varying(125) NOT NULL,
  year_id integer NOT NULL,
  manufacture_id integer NOT NULL,

  CONSTRAINT manufacture_fk_id FOREIGN KEY (manufacture_id) REFERENCES manufacture (id),
  CONSTRAINT year_id_fk FOREIGN KEY (year_id) REFERENCES year (id),
  PRIMARY KEY(id)
);


INSERT INTO manufacture (make_code,name)
	SELECT DISTINCT make_code,make_title
	FROM car_models;