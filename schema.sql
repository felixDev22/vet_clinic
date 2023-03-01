/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(100),
    date_of_birth DATE,
    neutered BOOLEAN,
    escape_attempts INT,
    weight_Kg DECIMAL(10,2),
    species VARCHAR(255)
);

CREATE TABLE owners (
    id BIGSERIAL PRIMARY KEY,
    Full_name VARCHAR(150) NOT NULL,
    Age INT NOT NULL
);

CREATE TABLE species (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(150)
);
