/* Populate database with sample data. */

INSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES('Agumon', TO_DATE('Feb 3rd,2020', 'Mon DDth, YYYY'), 0, true, 10.23);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Gabumon', TO_DATE('Nov 15th,2018', 'Mon DDth, YYYY'), 2, true, 8);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Pikachu', TO_DATE('Jan 7th,2021', 'Mon DDth YYYY'), 1, false, 15.04);
