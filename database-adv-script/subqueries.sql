-- Find all properties with average rating greater than 4.0
SELECT *
FROM properties
WHERE id IN (
    SELECT property_id
    FROM reviews
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
)
ORDER BY id;
