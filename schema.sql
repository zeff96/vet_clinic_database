/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
    id INT GENERATED ALWAYS AS IDENTITY,
    name varchar,
    date_of_birth date,
    escape_attempts integer,
    neutered boolean,
    weight_kg decimal,
    PRIMARY KEY(id)
);

ALTER TABLE animals ADD species varchar(255);

ALTER TABLE animals DROP column species;


CREATE TABLE owners(
    id SERIAL PRIMARY KEY,
    full_name VARCHAR,
    age INT
);

CREATE TABLE species(
    id SERIAL PRIMARY KEY,
    name VARCHAR
);
