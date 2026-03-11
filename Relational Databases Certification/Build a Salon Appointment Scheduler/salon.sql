CREATE DATABASE salon;
\c salon

CREATE TABLE customers(
  customer_id SERIAL PRIMARY KEY,
  phone VARCHAR(20) UNIQUE NOT NULL,
  name VARCHAR(50) NOT NULL
);

CREATE TABLE services(
  service_id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL
);

CREATE TABLE appointments(
  appointment_id SERIAL PRIMARY KEY,
  customer_id INT REFERENCES customers(customer_id),
  service_id INT REFERENCES services(service_id),
  time VARCHAR(20) NOT NULL
);

-- Add at least 3 services
INSERT INTO services(name) VALUES ('cut'), ('color'), ('perm');
