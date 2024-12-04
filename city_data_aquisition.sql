-- DATA BASE CREATION

-- create database
CREATE DATABASE cities;

-- TABLE CREATION
-- use cities
USE cities;

-- city table
CREATE TABLE city (
	city_id INT AUTO_INCREMENT,
    city VARCHAR(255) NOT NULL,
    country VARCHAR(255),
    latitude FLOAT,
    longitude FLOAT,
    PRIMARY KEY (city_id)
    );


-- population table
CREATE TABLE population (
	population_id INT AUTO_INCREMENT,
    population INT,
    year_data INT,
    city_id INT,
    PRIMARY KEY (population_id),
    FOREIGN KEY (city_id) REFERENCES city(city_id)
    );
    
    
-- weather table
CREATE TABLE weather (
	weather_id INT AUTO_INCREMENT,
    weatherstation VARCHAR(255) NOT NULL,
    city_id INT,
    forecast_time DATETIME,
    descr VARCHAR(255),
    temperature FLOAT,
    feels_like FLOAT,
    humidity FLOAT,
    wind FLOAT,
    time_retrieved DATETIME,
    PRIMARY KEY (weather_id),
	FOREIGN KEY (city_id) REFERENCES city(city_id)
    );
    

-- airport table
CREATE TABLE airport (
    icao VARCHAR(4),
    iata VARCHAR(3),
    airport_name VARCHAR(255),
    city_id INT NOT NULL,
    PRIMARY KEY (icao),
	FOREIGN KEY (city_id) REFERENCES city(city_id)
    );


-- flight table
CREATE TABLE flight (
	flight_id INT AUTO_INCREMENT,
    icao VARCHAR(4) NOT NULL,
    scheduled_arrival DATETIME,
    terminal VARCHAR(255),
	baggage_belt VARCHAR(255),
    departure_airport VARCHAR(255),
    flight_number VARCHAR(255),
    airline VARCHAR(255),
    data_retrieval_time DATETIME,
    PRIMARY KEY (flight_id),
	FOREIGN KEY (icao) REFERENCES airport(icao)
    );
    
-- check tables

SELECT *
FROM city;
SELECT *
FROM population;
SELECT *
FROM weather;
SELECT *
FROM airport;
SELECT *
FROM flight;