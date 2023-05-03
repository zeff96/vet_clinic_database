/* Populate database with sample data. */

/* Animals table data */

INSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES('Agumon', TO_DATE('Feb 3rd,2020', 'Mon DDth, YYYY'), 0, true, 10.23);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Gabumon', TO_DATE('Nov 15th,2018', 'Mon DDth, YYYY'), 2, true, 8);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Pikachu', TO_DATE('Jan 7th,2021', 'Mon DDth YYYY'), 1, false, 15.04);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Devimon', TO_DATE('May 12th,2017', 'Mon DDth YYYY'), 5, true, 11);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Charmander', TO_DATE('Feb 8th,2020','Mon DDth YYYY'), 0, false, -11);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Plantom', TO_DATE('Nov 15th,2021','Mon DDth YYYY'), 2, true, -5.7);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Squirtle', TO_DATE('Apr 2nd,1993','Mon DDth YYYY'), 3, false, -12.13);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Angemon', TO_DATE('Jun 12th,2005','Mon DDth YYYY'), 1, true, -45);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Boarmon', TO_DATE('Jun 7th,2005','Mon DDth YYYY'), 7, true, 20.4);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Blossom', TO_DATE('Oct 13th,1998','Mon DDth YYYY'), 3, true, 17);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Ditto', TO_DATE('May 14th,2022','Mon DDth YYYY'), 4, true, 22);

/* Owners table data */

INSERT INTO owners(full_name, age) VALUES('Sam Smith', 34);
INSERT INTO owners(full_name, age) VALUES('Jennifer Orwell', 19);
INSERT INTO owners(full_name, age) VALUES('Bob', 45);
INSERT INTO owners(full_name, age) VALUES('Melody Pond ', 77);
INSERT INTO owners(full_name, age) VALUES('Dean Winchester', 14);

