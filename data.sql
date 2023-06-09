/* Populate database with sample data. */

/* Animals table data */

INSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES('Agumon', TO_DATE('Feb 3rd,2020', 'Mon DDth, YYYY'), 0, true, 10.23);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Gabumon', TO_DATE('Nov 15th,2018', 'Mon DDth, YYYY'), 2, true, 8);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Pikachu', TO_DATE('Jan 7th,2021', 'Mon DDth YYYY'), 1, false, 15.04);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Devimon', TO_DATE('May 12th,2017', 'Mon DDth YYYY'), 5, true, 11);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Charmander', TO_DATE('Feb 8th,2020','Mon DDth YYYY'), 0, false, -11);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Plantmon', TO_DATE('Nov 15th,2021','Mon DDth YYYY'), 2, true, -5.7);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Squirtle', TO_DATE('Apr 2nd,1993','Mon DDth YYYY'), 3, false, -12.13);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Angemon', TO_DATE('Jun 12th,2005','Mon DDth YYYY'), 1, true, -45);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Boarmon', TO_DATE('Jun 7th,2005','Mon DDth YYYY'), 7, true, 20.4);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Blossom', TO_DATE('Oct 13th,1998','Mon DDth YYYY'), 3, true, 17);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Ditto', TO_DATE('May 14th,2022','Mon DDth YYYY'), 4, true, 22);

/* Owners table data */

INSERT INTO owners(full_name, age) VALUES('Sam Smith', 34);
INSERT INTO owners(full_name, age) VALUES('Jennifer Orwell', 19);
INSERT INTO owners(full_name, age) VALUES('Bob', 45);
INSERT INTO owners(full_name, age) VALUES('Melody Pond', 77);
INSERT INTO owners(full_name, age) VALUES('Dean Winchester', 14);
INSERT INTO owners(full_name, age) VALUES('Jodie Whittaker', 38);
INSERT INTO owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';

UPDATE animals
SET owner_id = CASE
WHEN name = 'Agumon' THEN(SELECT id FROM owners WHERE full_name = 'Sam Smith')
WHEN name IN ('Gabumon', 'Pikachu') THEN(SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
WHEN name IN ('Devimon', 'Plantmon') THEN(SELECT id FROM owners WHERE full_name = 'Bob')
WHEN name IN('Charmander', 'Squirtle','Blossom') THEN(SELECT id  FROM owners WHERE full_name = 'Melody Pond')
WHEN name IN('Angemon', 'Boarmon') THEN(SELECT id FROM owners WHERE full_name = 'Dean Winchester')
ELSE NULL
END;


/* Species table data */

INSERT INTO species(name) VALUES('Pokemon');
INSERT INTO species(name) VALUES('Digimon');

UPDATE animals
SET species_id = CASE
WHEN name LIKE '%mon%' THEN (SELECT id FROM species WHERE name = 'Digimon')
ELSE(SELECT id FROM species WHERE name = 'Pokemon')
END;

/* Vets table data */

INSERT INTO vets(name, age, date_of_graduation) VALUES ('William Tatcher', 45, TO_DATE('Apr 23rd, 2000', 'Mon DDth YYYY'));
INSERT INTO vets(name, age, date_of_graduation) VALUES ('Maisy Smith', 26, TO_DATE('Jan 17th, 2019', 'Mon DDth YYYY'));
INSERT INTO vets(name, age, date_of_graduation) VALUES ('Stephanie Mendez', 64, TO_DATE('May 4th, 1981', 'Mon DDth YYYY'));
INSERT INTO vets(name, age, date_of_graduation) VALUES ('Jack Harkness', 38, TO_DATE('Jun 8th, 2008', 'Mon DDth YYYY'));

/* Specialization table data */

INSERT INTO specializations (species_id, vet_id)
SELECT id, (SELECT id FROM vets WHERE name = 'William Tatcher') FROM species WHERE name = 'Pokemon'
UNION ALL
SELECT id, (SELECT id FROM vets WHERE name = 'Stephanie Mendez') FROM species WHERE name IN ('Digimon', 'Pokemon')
UNION ALL
SELECT id, (SELECT id FROM vets WHERE name = 'Jack Harkness') FROM species WHERE name = 'Digimon';


/* Visits table data */

INSERT INTO visits(animals_id, vets_id, date_of_visit)
VALUES
  ((SELECT id FROM animals WHERE name = 'Agumon'), (SELECT id FROM vets WHERE name = 'William Tatcher'), TO_DATE('May 24th, 2020', 'Mon DDth YYYY')),
  ((SELECT id FROM animals WHERE name = 'Agumon'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), TO_DATE('Jul 22th, 2020', 'Mon DDth YYYY')),
  ((SELECT id FROM animals WHERE name = 'Gabumon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), TO_DATE('Feb 2nd, 2021', 'Mon DDth YYYY')),
  ((SELECT id FROM animals WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), TO_DATE('Jan 5th, 2020', 'Mon DDth YYYY')),
  ((SELECT id FROM animals WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), TO_DATE('Mar 8th, 2020', 'Mon DDth YYYY')),
  ((SELECT id FROM animals WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), TO_DATE('May 14th,2020', 'Mon DDth YYYY')),
  ((SELECT id FROM animals WHERE name = 'Devimon'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), TO_DATE('May 4th, 2021', 'Mon DDth YYYY')),
  ((SELECT id FROM animals WHERE name = 'Charmander'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), TO_DATE('Feb 24th, 2021', 'Mon DDth YYYY')),
  ((SELECT id FROM animals WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), TO_DATE('Dec 21st, 2019', 'Mon DDth YYYY')),
  ((SELECT id FROM animals WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'William Tatcher'), TO_DATE('Aug 10th, 2020', 'Mon DDth YYYY')),
  ((SELECT id FROM animals WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), TO_DATE('Apr 7th, 2021', 'Mon DDth YYYY')),
  ((SELECT id FROM animals WHERE name = 'Squirtle'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), TO_DATE('Sep 29th, 2019', 'Mon DDth YYYY')),
  ((SELECT id FROM animals WHERE name = 'Angemon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), TO_DATE('Oct 3rd, 2020', 'Mon DDth YYYY')),
  ((SELECT id FROM animals WHERE name = 'Angemon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), TO_DATE('Nov 4th, 2020', 'Mon DDth YYYY')),
  ((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), TO_DATE('Jan 24th, 2019', 'Mon DDth YYYY')),
  ((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), TO_DATE('May 15th, 2019', 'Mon DDth YYYY')),
  ((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), TO_DATE('Feb 27th, 2020', 'Mon DDth YYYY')),
  ((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), TO_DATE('Aug 3rd, 2020', 'Mon DDth YYYY')),
  ((SELECT id FROM animals WHERE name = 'Blossom'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), TO_DATE('May 24th, 2020', 'Mon DDth YYYY')),
  ((SELECT id FROM animals WHERE name = 'Blossom'), (SELECT id FROM vets WHERE name = 'William Tatcher'), TO_DATE('Jan 11th, 2021', 'Mon DDth YYYY'));

  INSERT INTO visits (animals_id, vets_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;
