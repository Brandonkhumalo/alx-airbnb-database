-- Step 1: Query performance analysis on a specific property

EXPLAIN ANALYZE
SELECT * FROM bookings
WHERE property_id = 101;

-- Suggested Indexing for property_id
CREATE INDEX idx_property_id ON bookings(property_id);

-- Step 2: Re-run query after creating index
EXPLAIN ANALYZE
SELECT * FROM bookings
WHERE property_id = 101;

-- Step 3: Query performance analysis for booking by user and date range

EXPLAIN ANALYZE
SELECT * FROM bookings
WHERE user_id = 45 AND start_date BETWEEN '2023-01-01' AND '2023-12-31';

-- Suggested Composite Indexing for user_id and start_date
CREATE INDEX idx_user_start_date ON bookings(user_id, start_date);

-- Step 4: Re-run query after creating composite index
EXPLAIN ANALYZE
SELECT * FROM bookings
WHERE user_id = 45 AND start_date BETWEEN '2023-01-01' AND '2023-12-31';

-- Step 5: Summary of changes

-- The following is to create indexes for optimization.
-- Create index on property_id to speed up property lookups
CREATE INDEX idx_property_id ON bookings(property_id);

-- Create a composite index for user_id and start_date to optimize date range queries by user
CREATE INDEX idx_user_start_date ON bookings(user_id, start_date);
