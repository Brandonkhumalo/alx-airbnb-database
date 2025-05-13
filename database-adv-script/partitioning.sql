-- Step 1: Create the partitioned Booking table

-- Assuming the Booking table already exists, we will create a partitioned version based on the start_date column.
-- We will partition the table by range on the `start_date` column.

-- First, we drop the existing table if necessary (Be sure to backup your data first)
-- DROP TABLE IF EXISTS bookings_partitioned;

-- Create the partitioned table (assuming a PostgreSQL environment):
CREATE TABLE bookings_partitioned (
    booking_id SERIAL PRIMARY KEY,
    user_id INT,
    property_id INT,
    booking_date DATE,
    check_in_date DATE,
    check_out_date DATE,
    start_date DATE,    -- The column we're partitioning by
    end_date DATE,
    amount DECIMAL,
    status VARCHAR(50)
) PARTITION BY RANGE (start_date);

-- Step 2: Create partitions for specific ranges of start_date

-- Example: Partitioning by year
CREATE TABLE bookings_2023 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE bookings_2024 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE bookings_2025 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- Additional partitions can be added as needed based on the date ranges.

-- Step 3: Optional - Create indexes on the partitioned tables

-- Example: Index on start_date for faster querying within each partition
CREATE INDEX idx_bookings_2023_start_date ON bookings_2023 (start_date);
CREATE INDEX idx_bookings_2024_start_date ON bookings_2024 (start_date);
CREATE INDEX idx_bookings_2025_start_date ON bookings_2025 (start_date);

-- Step 4: Check the query performance with the partitioned table

-- Query to retrieve all bookings within a specific date range
EXPLAIN ANALYZE
SELECT * FROM bookings_partitioned
WHERE start_date BETWEEN '2023-01-01' AND '2023-12-31';

-- You can analyze how the partitioned table performs with the EXPLAIN ANALYZE command
-- and observe improved performance by limiting the search scope to relevant partitions.
