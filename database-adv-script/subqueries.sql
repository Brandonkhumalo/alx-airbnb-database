-- 1. Non-Correlated Subquery to find all properties where the average rating is greater than 4.0
SELECT 
    property_id,
    name,
    location
FROM 
    properties
WHERE 
    property_id IN (
        SELECT 
            property_id
        FROM 
            reviews
        GROUP BY 
            property_id
        HAVING 
            AVG(rating) > 4.0
    );

-- 2. Correlated Subquery to find users who have made more than 3 bookings
SELECT 
    users.user_id,
    users.first_name,
    users.last_name,
    users.email
FROM 
    users
WHERE 
    (SELECT 
        COUNT(*)
    FROM 
        bookings
    WHERE 
        bookings.user_id = users.user_id) > 3;
