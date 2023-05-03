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
   id INT GENERATED ALWAYS AS IDENTITY,
    full_name VARCHAR,
    age INT
    PRIMARY KEY(id)
);

CREATE TABLE species(
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR
    PRIMARY KEY(id)
);
