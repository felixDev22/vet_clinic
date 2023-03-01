/* Populate database with animal data. */
INSERT INTO animals (animal_name, date_of_birth, escape_attempts, neutered, weight_per_kg)
VALUES ('Agumon',  '02/02/2020', '0', 'true', '10.23');

INSERT INTO animals (animal_name, date_of_birth, escape_attempts, neutered, weight_per_kg)
VALUES ('Gabumon', '2018/11/15', '2', 'true', '8');

INSERT INTO animals (animal_name, date_of_birth, escape_attempts, neutered, weight_per_kg)
VALUES ('Pikachu', '2021/01/17', '1', 'false', '15.04');

INSERT INTO animals (animal_name, date_of_birth, escape_attempts, neutered, weight_per_kg)
VALUES ('Devimon', '2017/04/12', '5', 'true', '11');

/* Add Inserts for data into the database for query and update milestone */

INSERT INTO animals (animal_name, date_of_birth, escape_attempts, neutered, weight_per_kg)
VALUES ('Charmander',  '2020/02/08', '0', 'false', '-11');

INSERT INTO animals (animal_name, date_of_birth, escape_attempts, neutered, weight_per_kg)
VALUES ('Plantmon',  '2022/11/05', '2', 'true', '-5.7');

INSERT INTO animals (animal_name, date_of_birth, escape_attempts, neutered, weight_per_kg)
VALUES ('Squirtle',  '1993/04/02', '3', 'false', '-12.13');

INSERT INTO animals (animal_name, date_of_birth, escape_attempts, neutered, weight_per_kg)
VALUES ('Angemon',  '2005/06/12', '1', 'true', '-45');

INSERT INTO animals (animal_name, date_of_birth, escape_attempts, neutered, weight_per_kg)
VALUES ('Boarmon',  '2005/06/07', '7', 'true', '20.4');


INSERT INTO animals (animal_name, date_of_birth, escape_attempts, neutered, weight_per_kg)
VALUES ('Blossom',  '1998/10/13', '3', 'true', '17');


/* Insert Owners Names and Ages Into Owners Table */
INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners (full_name, age) VALUES ('Jennifer Orwell', 19), ('Bob', 45);
INSERT INTO owners (full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners (full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners (full_name, age) VALUES ('Jodie Whittaker', 38);

/* Insert Species Names Into Species Table. */
INSERT INTO species (name) VALUES ('Pokemon'), ('Digimon');

/* Update animals Table. */
UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Digimon') WHERE name LIKE '%mon';
UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Pokemon') WHERE name NOT LIKE '%mon';

/* Update animals table to include owners info */
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith') WHERE name = 'Agumon';
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell') WHERE name = 'Gabumon' OR name = 'Pikachu';
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob') WHERE name = 'Devimon' OR name = 'Plantmon';
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond') WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester') WHERE name = 'Angemon' OR name = 'Boarmon';