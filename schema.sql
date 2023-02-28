/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    date_of_birth DATE,
    neutered BOOLEAN,
    escape_attempts INT,
    weight_Kg DECIMAL(10,2),
    species VARCHAR(255)
);
