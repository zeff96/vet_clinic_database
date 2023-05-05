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
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(255),
    age INT,
    date_of_graduation DATE,
    PRIMARY KEY(id)
);

CREATE TABLE specializations(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  species_id INT,
  vet_id INT,
  FOREIGN KEY(species_id) REFERENCES species(id),
  FOREIGN KEY(vet_id) REFERENCES vets(id)
);


CREATE TABLE visits(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    animals_id INT,
    vets_id INT,
    date_of_visit DATE,
    FOREIGN KEY(animals_id) REFERENCES animals(id),
    FOREIGN KEY(vets_id) REFERENCES vets(id)
);