-- 1. Query to find the total number of bookings made by each user, using COUNT and GROUP BY
SELECT 
    user_id,
    COUNT(*) AS total_bookings
FROM 
    bookings
GROUP BY 
    user_id;

-- 2. Query to rank properties based on the total number of bookings they have received, using a window function
SELECT 
    property_id,
    name,
    COUNT(*) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS booking_rank
FROM 
    bookings
JOIN 
    properties ON bookings.property_id = properties.property_id
GROUP BY 
    property_id, name
ORDER BY 
    booking_rank;
