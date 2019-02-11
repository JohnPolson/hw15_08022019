-- psql -d gym -f gym.sql

DROP TABLE bookings;
DROP TABLE members;
DROP TABLE lessons;

CREATE TABLE lessons
(
  id SERIAL8 primary key,
  title VARCHAR(255),
  instructor VARCHAR(255),
  capacity INT2
);

CREATE TABLE members
(
  id SERIAL8 primary key,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  age INT2,
  address VARCHAR(255),
  email VARCHAR(255)
);

CREATE TABLE bookings
(
  id SERIAL8 primary key,
  member_id INT8 references members(id),
  lesson_id INT8 references lessons(id)
);
