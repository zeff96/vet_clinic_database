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

ALTER TABLE animals
ADD species_id INT,
ADD CONSTRAINT fk_species FOREIGN KEY(species_id) REFERENCES species(id);

ALTER TABLE animals
ADD owner_id INT,
ADD CONSTRAINT fk_owners FOREIGN KEY(owner_id) REFERENCES owners(id);

CREATE TABLE owners(
   id INT GENERATED ALWAYS AS IDENTITY,
    full_name VARCHAR,
    age INT,
    PRIMARY KEY(id)
);

CREATE TABLE species(
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR,
    PRIMARY KEY(id)
);

CREATE TABLE vets(
    id INT AUTO_INCREMENT,
    name VARCHAR(255),
    age INT,
    date_of_graduation DATE,
    PRIMARY KEY(id)
);
