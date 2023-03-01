/* Populate database with sample data. */

INSERT INTO animals (id, name, date_of_birth, neutered, escape_attempts, weight_Kg )
VALUES (1, 'Agumon', '2020-02-03', true, 0, 10.23);

INSERT INTO animals (id, name, date_of_birth, neutered, escape_attempts, weight_Kg )
VALUES (2, 'Gabumon', '2018-11-15', true, 2, 8); 

INSERT INTO animals (id, name, date_of_birth, neutered, escape_attempts, weight_Kg )
VALUES (3, 'Pikachu', '2021-01-07', false, 1, 15.04); 

INSERT INTO animals (id, name, date_of_birth, neutered, escape_attempts, weight_Kg )
VALUES (4, 'Devimon', '2017-05-12', true, 5, 11); 


-- Vet clinic database: query and update animals table
INSERT INTO animals (id, name, date_of_birth, neutered, escape_attempts, weight_Kg )
VALUES (5, 'Charmander', '2020-02-08', false, 0, -11); 

INSERT INTO animals (id, name, date_of_birth, neutered, escape_attempts, weight_Kg )
VALUES (6, 'Plantmon', '2021-11-15', true, 2, -5.7); 

INSERT INTO animals (id, name, date_of_birth, neutered, escape_attempts, weight_Kg )
VALUES (7, 'Squirtle', '1993-04-02', false, 3, -12.13); 

INSERT INTO animals (id, name, date_of_birth, neutered, escape_attempts, weight_Kg )
VALUES (8, 'Angemon', '2005-06-12', true, 1, -45); 

INSERT INTO animals (id, name, date_of_birth, neutered, escape_attempts, weight_Kg )
VALUES (9, 'Boarmon', '2005-06-07', true, 7, 20.4);

INSERT INTO animals (id, name, date_of_birth, neutered, escape_attempts, weight_Kg )
VALUES (10, 'Blossom', '1998-10-13', true, 3, 17); 

INSERT INTO animals (id, name, date_of_birth, neutered, escape_attempts, weight_Kg )
VALUES (11, 'Ditto', '2022-05-14', true, 4, 22); 



--query multiple - populate owners 

INSERT INTO owners (Full_name, Age) VALUES ('Sam Smith', 34);
INSERT INTO owners (Full_name, Age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners (Full_name, Age) VALUES ('Bob', 45);
INSERT INTO owners (Full_name, Age) VALUES ('Melody Pond', 77);
INSERT INTO owners (Full_name, Age) VALUES ('Dean Winchester', 14);
INSERT INTO owners (Full_name, Age) VALUES ('Jodie Whittaker', 38);



--query multiple - populate owners 
INSERT INTO species (name) VALUES ('Pokemon');
INSERT INTO species (name) VALUES ('Digimon');

-- Modify animals table to add the species_id column
ALTER TABLE animals ADD COLUMN species_id INTEGER;

-- Set the species_id for each animal based on the name
UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 1 WHERE species_id IS NULL;

-- Modify animals table to add the owner_id column
ALTER TABLE animals ADD COLUMN owner_id INTEGER;

-- Set the owner_id for each animal based on the owner's name
UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name IN ('Gabumon', 'Pikachu');
UPDATE animals SET owner_id = 3 WHERE name IN ('Devimon', 'Plantmon');
UPDATE animals SET owner_id = 4 WHERE name IN ('Charmander', 'Squirtle', 'Blossom');
UPDATE animals SET owner_id = 5 WHERE name IN ('Angemon', 'Boarmon');