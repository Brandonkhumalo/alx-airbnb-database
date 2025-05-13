-- Analyzing the query performance using EXPLAIN
EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.booking_date,
    b.check_in_date,
    b.check_out_date,
    u.user_id,
    u.email,
    u.first_name,
    u.last_name,
    p.property_id,
    p.property_name,
    p.location,
    p.price_per_night,
    p.property_type,
    pay.payment_id,
    pay.amount,
    pay.payment_date,
    pay.payment_method
FROM 
    bookings b
JOIN 
    users u ON b.user_id = u.user_id
JOIN 
    properties p ON b.property_id = p.property_id
JOIN 
    payments pay ON b.booking_id = pay.booking_id;

-- EXPLAIN ANALYZE will show the execution plan and performance metrics for this query.
-- Based on the EXPLAIN output, we will optimize the query further.

-- Step 1: Create indexes on frequently used columns in WHERE, JOIN, or ORDER BY clauses.

-- Indexes on columns used in joins:
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_booking_id ON bookings(booking_id);

-- Index on columns used in JOINs for users and payments:
CREATE INDEX idx_users_user_id ON users(user_id);
CREATE INDEX idx_properties_property_id ON properties(property_id);
CREATE INDEX idx_payments_booking_id ON payments(booking_id);

-- Step 2: Refactor the query to reduce unnecessary joins and improve performance.

-- Refactored query:
-- In this refactored version, we are trying to minimize the joins on tables that are not necessary in some cases.
-- For example, if the `payments` table is large and the payments might not be available for all bookings, 
-- it might be worth filtering out those cases.

-- Refactor Query with LEFT JOIN for payments (to handle cases where no payment exists yet):
SELECT 
    b.booking_id,
    b.booking_date,
    b.check_in_date,
    b.check_out_date,
    u.user_id,
    u.email,
    u.first_name,
    u.last_name,
    p.property_id,
    p.property_name,
    p.location,
    p.price_per_night,
    p.property_type,
    pay.payment_id,
    pay.amount,
    pay.payment_date,
    pay.payment_method
FROM 
    bookings b
JOIN 
    users u ON b.user_id = u.user_id
JOIN 
    properties p ON b.property_id = p.property_id
LEFT JOIN 
    payments pay ON b.booking_id = pay.booking_id;

-- Step 3: Use EXPLAIN ANALYZE again to compare the execution plan of the refactored query.
EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.booking_date,
    b.check_in_date,
    b.check_out_date,
    u.user_id,
    u.email,
    u.first_name,
    u.last_name,
    p.property_id,
    p.property_name,
    p.location,
    p.price_per_night,
    p.property_type,
    pay.payment_id,
    pay.amount,
    pay.payment_date,
    pay.payment_method
FROM 
    bookings b
JOIN 
    users u ON b.user_id = u.user_id
JOIN 
    properties p ON b.property_id = p.property_id
LEFT JOIN 
    payments pay ON b.booking_id = pay.booking_id;

-- The new query uses a LEFT JOIN to payments to handle cases where bookings have no payments.
-- This reduces unnecessary rows and can improve performance.
