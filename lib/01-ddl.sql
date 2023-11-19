BEGIN;
CREATE TABLE cities (
	id serial PRIMARY KEY,
	name VARCHAR,
	country VARCHAR,
	subcountry VARCHAR,
	geonameid INT
);
COMMIT;
