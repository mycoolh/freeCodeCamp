-- Connect to the postgres database first to create universe
-- psql --username=freecodecamp --dbname=postgres
-- CREATE DATABASE universe;
-- \c universe

-- 1. CREATE TABLES
CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    description TEXT,
    has_life BOOLEAN NOT NULL,
    distance_from_earth NUMERIC
);

CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    galaxy_id INT REFERENCES galaxy(galaxy_id) NOT NULL,
    name VARCHAR(50) UNIQUE NOT NULL,
    is_spherical BOOLEAN NOT NULL,
    age_in_millions_of_years INT
);

CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    star_id INT REFERENCES star(star_id) NOT NULL,
    name VARCHAR(50) UNIQUE NOT NULL,
    has_life BOOLEAN NOT NULL,
    is_spherical BOOLEAN,
    planet_types INT
);

CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    planet_id INT REFERENCES planet(planet_id) NOT NULL,
    name VARCHAR(50) UNIQUE NOT NULL,
    is_spherical BOOLEAN NOT NULL,
    diameter_km INT
);

CREATE TABLE constellation (
    constellation_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    visible_season TEXT,
    star_count INT
);

-- 2. INSERT DATA
INSERT INTO galaxy (name, description, has_life, distance_from_earth) VALUES
('Milky Way', 'Home', true, 0), ('Andromeda', 'Spiral', false, 2.5), 
('Triangulum', 'Small', false, 3.0), ('Sombrero', 'Hat-like', false, 29), 
('Whirlpool', 'Swirly', false, 23), ('Black Eye', 'Dark', false, 17);

INSERT INTO star (name, galaxy_id, is_spherical, age_in_millions_of_years) VALUES
('Sun', 1, true, 4600), ('Sirius', 1, true, 242), ('Betelgeuse', 1, true, 10), 
('Rigel', 1, true, 8), ('Vega', 1, true, 455), ('Altair', 1, true, 1200);

INSERT INTO planet (name, star_id, has_life, is_spherical, planet_types) VALUES
('Mercury', 1, false, true, 1), ('Venus', 1, false, true, 1), ('Earth', 1, true, true, 1), 
('Mars', 1, false, true, 1), ('Jupiter', 1, false, true, 2), ('Saturn', 1, false, true, 2), 
('Uranus', 1, false, true, 2), ('Neptune', 1, false, true, 2), ('Proxima B', 2, false, true, 3), 
('Kepler-1', 3, false, true, 3), ('Gliese', 4, false, true, 3), ('HD-X', 5, false, true, 3);

INSERT INTO moon (name, planet_id, is_spherical, diameter_km) VALUES
('Moon', 3, true, 3474), ('Phobos', 4, false, 22), ('Deimos', 4, false, 12), 
('Io', 5, true, 3642), ('Europa', 5, true, 3121), ('Ganymede', 5, true, 5268), 
('Callisto', 5, true, 4820), ('Titan', 6, true, 5150), ('Enceladus', 6, true, 504), 
('Mimas', 6, true, 396), ('Dione', 6, true, 1122), ('Rhea', 6, true, 1527), 
('Iapetus', 6, true, 1469), ('Triton', 8, true, 2706), ('Titania', 7, true, 1577), 
('Oberon', 7, true, 1522), ('Umbriel', 7, true, 1169), ('Ariel', 7, true, 1157), 
('Miranda', 7, true, 471), ('Charon', 8, true, 1212);

INSERT INTO constellation (name, visible_season, star_count) VALUES
('Orion', 'Winter', 7), ('Ursa Major', 'Spring', 7), ('Lyra', 'Summer', 5);