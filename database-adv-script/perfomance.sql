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
