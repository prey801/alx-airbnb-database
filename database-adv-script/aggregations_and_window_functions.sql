-- Total number of bookings made by each user
SELECT user_id, COUNT(*) AS total_bookings
FROM bookings
GROUP BY user_id
ORDER BY user_id;

-- Rank properties based on the total number of bookings using ROW_NUMBER
SELECT 
    property_id,
    COUNT(*) AS total_bookings,
    ROW_NUMBER() OVER (ORDER BY COUNT(*) DESC) AS booking_rank,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS booking_rank_with_ties
FROM bookings
GROUP BY property_id
ORDER BY booking_rank;
