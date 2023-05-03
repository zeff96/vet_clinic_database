/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon%';
SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT * FROM animals WHERE neutered = 't' AND escape_attempts < 3;
SELECT date_of_birth FROM animals  WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = 't';
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

BEGIN TRANSACTION;
UPDATE animals
SET species = 'undefined';
SELECT * FROM animals;
ROLLBACK
SELECT * FROM animals;

BEGIN TRANSACTION;
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon%';
UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;
SELECT * FROM animals;
COMMIT;
SELECT * FROM animals;

BEGIN TRANSACTION;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK
SELECT * FROM animals;

BEGIN TRANSACTION;
DELETE FROM animals
WHERE date_of_birth > '2022-01-01';
SAVEPOINT SP1;
UPDATE animals
SET weight_kg = weight_kg * -1;
ROLLBACK TO SP1;
UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;
SELECT * FROM animals;
COMMIT;
SELECT * FROM animals;

SELECT COUNT(*) FROM animals;

SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;

SELECT AVG(weight_kg) FROM animals;

SELECT neutered, COUNT(*) as escape_attempts
FROM animals
WHERE escape_attempts > 0
GROUP BY neutered;

SELECT species, MIN(weight_kg), MAX(weight_kg) 
FROM animals
GROUP BY species;

SELECT species, AVG(escape_attempts) AS avg_escape_attempts
FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species;

SELECT animals.name FROM animals
INNER JOIN owners 
ON animals.owner_id = owners.id
WHERE owners.full_name = 'Melody Pond';

SELECT animals.name FROM animals
INNER JOIN species 
ON animals.species_id = species.id
WHERE species.name = 'Pokemon';

SELECT owners.full_name, animals.name FROM owners 
FULL JOIN animals ON animals.owner_id = owners.id;

SELECT species.name, COUNT(*) AS total_counts
FROM animals INNER JOIN species 
ON animals.species_id = species.id
GROUP BY species.name;

SELECT animals.name FROM animals
INNER JOIN species 
ON animals.species_id = species.id
INNER JOIN owners 
ON animals.owner_id = owners.id
WHERE species.name = 'Digimon' AND owners.full_name = 'Jennifer Orwell';

SELECT animals.name, animals.escape_attempts
FROM animals
INNER JOIN owners
ON animals.owner_id = owners.id
WHERE animals.escape_attempts < 0 AND owners.full_name = 'Dean Winchester';

SELECT owners.full_name,  COUNT(*) AS highest_count
FROM animals
INNER JOIN owners
ON animals.owner_id = owners.id
GROUP BY owners.full_name;