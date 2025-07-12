-- Initial unoptimized query with WHERE and AND
SELECT 
    b.id AS booking_id,
    u.name AS user_name,
    p.name AS property_name,
    pay.amount AS payment_amount,
    b.created_at AS booking_date
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON pay.booking_id = b.id
WHERE b.created_at >= '2024-01-01' AND pay.amount > 100
ORDER BY b.created_at DESC;

-- Optimized query with indexes
EXPLAIN SELECT 
    b.id AS booking_id,
    u.name AS user_name,
    p.name AS property_name,
    pay.amount AS payment_amount,
    b.created_at AS booking_date
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON pay.booking_id = b.id
WHERE b.created_at >= '2024-01-01' AND pay.amount > 100
ORDER BY b.created_at DESC;
