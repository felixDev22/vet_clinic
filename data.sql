/* Populate database with animal data. */
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_per_kg)
VALUES ('Agumon',  '02/02/2020', '0', 'true', '10.23');

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_per_kg)
VALUES ('Gabumon', '2018/11/15', '2', 'true', '8');

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_per_kg)
VALUES ('Pikachu', '2021/01/17', '1', 'false', '15.04');

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_per_kg)
VALUES ('Devimon', '2017/04/12', '5', 'true', '11');

/* Add Inserts for data into the database for query and update milestone */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_per_kg)
VALUES ('Charmander',  '2020/02/08', '0', 'false', '-11');

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_per_kg)
VALUES ('Plantmon',  '2022/11/05', '2', 'true', '-5.7');

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_per_kg)
VALUES ('Squirtle',  '1993/04/02', '3', 'false', '-12.13');

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_per_kg)
VALUES ('Angemon',  '2005/06/12', '1', 'true', '-45');

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_per_kg)
VALUES ('Boarmon',  '2005/06/07', '7', 'true', '20.4');


INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_per_kg)
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



--Insert vets Data;
INSERT INTO vets (name, Age, date_of_graduation)
VALUES ('William Tatcher', 45, date '2000-04-23');
INSERT INTO vets (name, Age, date_of_graduation) 
VALUES ('Maisy Smith', 26, date '2019-01-17');
INSERT INTO vets (name, Age, date_of_graduation) 
VALUES ('Stephanie Mendez', 64, date '1981-05-04');
INSERT INTO vets (name, Age, date_of_graduation) 
VALUES ('Jack Harkness', 38, date '2008-06-08');


--Insert data in specializations table

-- Vet William Tatcher is specialized in Pokemon.
INSERT INTO specializations (vets_id, species_id)
VALUES ((SELECT id FROM vets WHERE name = 'William Tatcher'), (SELECT id FROM species WHERE name = 'Pokemon'));

-- Vet Stephanie Mendez is specialized in Digimon and Pokemon.
INSERT INTO specializations (vets_id, species_id) 
VALUES ((SELECT id FROM vets WHERE name = 'Stephanie Mendez'), (SELECT id FROM species WHERE name = 'Pokemon')),
((SELECT id FROM vets WHERE name = 'Stephanie Mendez'), (SELECT id FROM species WHERE name = 'Digimon'));

-- Vet Jack Harkness is specialized in Digimon.
INSERT INTO specializations (vets_id, species_id)
VALUES ((SELECT id FROM vets WHERE name = 'Jack Harkness'), (SELECT id FROM species WHERE name = 'Digimon'));



-- Vet Visits
INSERT INTO visits (animals_id, vets_id, date_of_visit)
VALUES ((SELECT id FROM animals WHERE name = 'Agumon'), (SELECT id FROM vets WHERE name = 'William Tatcher'), '2020-05-24');

INSERT INTO visits (animals_id, vets_id, date_of_visit)
VALUES ((SELECT id FROM animals WHERE name = 'Agumon'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2020-07-22');


INSERT INTO visits (animals_id, vets_id, date_of_visit)
VALUES ((SELECT id FROM animals WHERE name = 'Gabumon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), '2021-02-02');


INSERT INTO visits (animals_id, vets_id, date_of_visit)
VALUES 
((SELECT MAX(id) FROM animals WHERE name = 'Pikachu'), (SELECT MAX(id) FROM vets WHERE name = 'Maisy Smith'), '2020-01-05'),
((SELECT MAX(id) FROM animals WHERE name = 'Pikachu'), (SELECT MAX(id) FROM vets WHERE name = 'Maisy Smith'), '2020-03-08'),
((SELECT MAX(id) FROM animals WHERE name = 'Pikachu'), (SELECT MAX(id) FROM vets WHERE name = 'Maisy Smith'), '2020-05-14'),
((SELECT MAX(id) FROM animals WHERE name = 'Devimon'), (SELECT MAX(id) FROM vets WHERE name = 'Stephanie Mendez'), '2021-05-04'),
((SELECT MAX(id) FROM animals WHERE name = 'Charmander'), (SELECT MAX(id) FROM vets WHERE name = 'Jack Harkness'), '2021-02-24');


INSERT INTO visits (animals_id, vets_id, date_of_visit) 
VALUES
((SELECT id FROM animals WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2019-12-21'),
((SELECT id FROM animals WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'William Tatcher'), '2020-08-10'),
((SELECT id FROM animals WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2021-04-07'),
((SELECT id FROM animals WHERE name = 'Squirtle'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2019-09-29'),
((SELECT id FROM animals WHERE name = 'Angemon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), '2020-10-03'),
((SELECT id FROM animals WHERE name = 'Angemon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), '2020-11-04');


INSERT INTO visits (animals_id, vets_id, date_of_visit) 
VALUES
((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2019-01-24'),
((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2019-05-15'),
((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-02-27'),
((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-08-03'),
((SELECT id FROM animals WHERE name = 'Blossom'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2020-05-24'),
((SELECT id FROM animals WHERE name = 'Blossom'), (SELECT id FROM vets WHERE name = 'William Tatcher'), '2021-01-11');


--AUDIT DATABASE

-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animals_id, vets_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animals_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';


EXPLAIN ANALYZE SELECT COUNT(*) FROM visits where animals_id = 4;
explain analyze SELECT * FROM visits where vets_id = 2;
EXPLAIN ANALYZE SELECT * FROM owners where email = 'owner_18327@mail.com';