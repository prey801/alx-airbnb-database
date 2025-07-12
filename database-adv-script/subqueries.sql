-- Retrieve all bookings and the respective users who made those bookings
SELECT b.*, u.*
FROM bookings b
INNER JOIN users u ON b.user_id = u.id
ORDER BY b.id;
-- Retrieve all properties and their reviews, including properties that have no reviews
SELECT p.*, r.*
FROM properties p
LEFT JOIN reviews r ON p.id = r.property_id
ORDER BY p.id;
-- Retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user
SELECT u.*, b.*
FROM users u
FULL OUTER JOIN bookings b ON u.id = b.user_id
ORDER BY u.id;
-- Emulated FULL OUTER JOIN for MySQL
SELECT u.*, b.*
FROM users u
LEFT JOIN bookings b ON u.id = b.user_id
UNION
SELECT u.*, b.*
FROM users u
RIGHT JOIN bookings b ON u.id = b.user_id
ORDER BY u.id;
