-- File: partitioning.sql

-- Step 1: Create the partitioned Booking table
CREATE TABLE bookings_partitioned (
    booking_id INT PRIMARY KEY,
    user_id INT,
    property_id INT,
    start_date DATE,
    end_date DATE,
    amount DECIMAL(10, 2)
)
PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION bookings_2020 VALUES LESS THAN (2021),
    PARTITION bookings_2021 VALUES LESS THAN (2022),
    PARTITION bookings_2022 VALUES LESS THAN (2023),
    PARTITION bookings_2023 VALUES LESS THAN (2024),
    PARTITION bookings_2024 VALUES LESS THAN (2025)
);

-- Step 2: Populate the partitioned Booking table (insert data)
-- Assume you have a dataset to populate the table, here is an example of inserting records:
INSERT INTO bookings_partitioned (booking_id, user_id, property_id, start_date, end_date, amount)
SELECT booking_id, user_id, property_id, start_date, end_date, amount FROM bookings;

-- Step 3: Test query before partitioning
-- Query: Retrieve all bookings for the year 2023
EXPLAIN ANALYZE
SELECT * FROM bookings
WHERE start_date BETWEEN '2023-01-01' AND '2023-12-31';

-- Step 4: Test query after partitioning
-- Query: Retrieve all bookings for the year 2023 from partitioned table
EXPLAIN ANALYZE
SELECT * FROM bookings_partitioned
WHERE start_date BETWEEN '2023-01-01' AND '2023-12-31';

-- Step 5: Performance testing comparison (run on database to observe timing)
-- Performance before and after partitioning can be compared using EXPLAIN ANALYZE as shown above.
