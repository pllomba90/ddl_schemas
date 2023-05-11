-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE passengers
(
  id SERIAL PRIMARY Key,
  first_name VARCHAR,
  last_name VARCHAR,
  seat_selection VARCHAR(3)
);

INSERT INTO passengers
(first_name, last_name, seat_selection)
VALUES
('Jennifer', 'Finch', '33B'),
('Thadeus', 'Gathercoal', '8A'),
('Sonja', 'Pauley', '12F'),
('Jennifer', 'Finch', '20A');

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL REFERENCES passengers,
  last_name TEXT NOT NULL REFERENCES passengers,
  seat TEXT NOT NULL REFERENCES passengers,
  departure TIMESTAMP NOT NULL REFERENCES flights,
  arrival TIMESTAMP NOT NULL,
  airline TEXT REFERENCES airlines,
  from_city TEXT NOT NULL REFERENCES airports,
  from_country TEXT NOT NULL,
  to_city TEXT NOT NULL REFERENCES airports,
  to_country TEXT NOT NULL
);

-- INSERT INTO tickets
--   (first_name, last_name, seat, departure, arrival, airline, from_city, from_country, to_city, to_country)
-- VALUES
--   ('Jennifer', 'Finch', '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 'United', 'Washington DC', 'United States', 'Seattle', 'United States'),
--   ('Thadeus', 'Gathercoal', '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 'British Airways', 'Tokyo', 'Japan', 'London', 'United Kingdom'),
--   ('Sonja', 'Pauley', '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 'Delta', 'Los Angeles', 'United States', 'Las Vegas', 'United States'),
--   ('Jennifer', 'Finch', '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 'Delta', 'Seattle', 'United States', 'Mexico City', 'Mexico'),
--   ('Waneta', 'Skeleton', '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 'TUI Fly Belgium', 'Paris', 'France', 'Casablanca', 'Morocco'),
--   ('Thadeus', 'Gathercoal', '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 'Air China', 'Dubai', 'UAE', 'Beijing', 'China'),
--   ('Berkie', 'Wycliff', '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 'United', 'New York', 'United States', 'Charlotte', 'United States'),
--   ('Alvin', 'Leathes', '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 'American Airlines', 'Cedar Rapids', 'United States', 'Chicago', 'United States'),
--   ('Berkie', 'Wycliff', '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 'American Airlines', 'Charlotte', 'United States', 'New Orleans', 'United States'),
--   ('Cory', 'Squibbes', '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 'Avianca Brasil', 'Sao Paolo', 'Brazil', 'Santiago', 'Chile');

  CREATE TABLE airlines(
    id SERIAL PRIMARY Key,
    name VARCHAR,
    hub VARCHAR,
    international BOOLEAN,
    planes INTEGER 
);

INSERT INTO airlines 
(name, hub, international, planes)
VALUES
('United', 'Washington DC', true, 75),
('British Airways', 'London', true, 100),
('Delta', 'Atlanta', true, 125),
('Air China', 'Beijing', true, 82),
('American Airlines', 'Charlotte', true, 89);

CREATE TABLE flights(
  id SERIAL PRIMARY Key,
  airline_name VARCHAR REFERENCES airlines(name),
  flight_date TIMESTAMP,
  origin VARCHAR REFERENCES airports,
  destination VARCHAR REFERENCES airports,
  number_of_passengers INTEGER
);

CREATE TABLE airports
(
  id SERIAL PRIMARY Key,
  name VARCHAR,
  code VARCHAR(3)
);
INSERT INTO airports
(name, code)
VALUES
('Atlanta', 'ATL'),
('Portland ME', 'PWM'),
('Los Angeles', 'LAX');

