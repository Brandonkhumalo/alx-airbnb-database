-- Database Indexing to Improve Query Performance

-- 1. Identify High-Usage Columns
-- Columns frequently used in WHERE, JOIN, or ORDER BY clauses:

-- User table:
-- user_id (used in JOINs, WHERE clauses)
-- email (often used in WHERE clauses)

-- Booking table:
-- booking_id (used in WHERE clauses, JOINs)
-- user_id (used in JOINs, WHERE clauses)
-- property_id (used in JOINs, WHERE clauses)
-- booking_date (used in ORDER BY)

-- Property table:
-- property_id (used in JOINs, WHERE clauses)
-- location (used in WHERE clauses)

-- 2. Create Indexes for High-Usage Columns

-- Index for 'user_id' in the 'users' table (commonly used in JOINs and WHERE clauses)
CREATE INDEX idx_users_user_id ON users(user_id);

-- Index for 'email' in the 'users' table (commonly used in WHERE clauses)
CREATE INDEX idx_users_email ON users(email);

-- Index for 'user_id' in the 'bookings' table (commonly used in JOINs and WHERE clauses)
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- Index for 'property_id' in the 'bookings' table (commonly used in JOINs and WHERE clauses)
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Index for 'booking_date' in the 'bookings' table (commonly used in ORDER BY clauses)
CREATE INDEX idx_bookings_booking_date ON bookings(booking_date);

-- Index for 'property_id' in the 'properties' table (commonly used in JOINs and WHERE clauses)
CREATE INDEX idx_properties_property_id ON properties(property_id);

-- Index for 'location' in the 'properties' table (commonly used in WHERE clauses)
CREATE INDEX idx_properties_location ON properties(location);

-- 3. Measure Query Performance Before and After Adding Indexes
-- Use EXPLAIN to analyze query performance before adding indexes
-- Example Query for User Join with Bookings:
EXPLAIN ANALYZE
SELECT 
    u.user_id, u.email, COUNT(b.booking_id) AS total_bookings
FROM 
    users u
JOIN 
    bookings b ON u.user_id = b.user_id
GROUP BY 
    u.user_id;

-- After creating the indexes, re-run the EXPLAIN command and compare performance.

-- Example of EXPLAIN usage after creating indexes:
EXPLAIN ANALYZE
SELECT 
    u.user_id, u.email, COUNT(b.booking_id) AS total_bookings
FROM 
    users u
JOIN 
    bookings b ON u.user_id = b.user_id
GROUP BY 
    u.user_id;

-- Compare the execution plans (before and after indexes) to measure performance improvement.
