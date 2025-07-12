-- Drop the table if it already exists
DROP TABLE IF EXISTS bookings_partitioned;

-- Create a partitioned version of the bookings table
CREATE TABLE bookings_partitioned (
    id INT PRIMARY KEY,
    user_id INT,
    property_id INT,
    start_date DATE,
    end_date DATE,
    created_at DATETIME
)
PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p2019 VALUES LESS THAN (2020),
    PARTITION p2020 VALUES LESS THAN (2021),
    PARTITION p2021 VALUES LESS THAN (2022),
    PARTITION p2022 VALUES LESS THAN (2023),
    PARTITION pmax VALUES LESS THAN MAXVALUE
);

-- Insert data from original bookings table
INSERT INTO bookings_partitioned
SELECT id, user_id, property_id, start_date, end_date, created_at FROM bookings;

-- Example query on partitioned table
EXPLAIN SELECT * FROM bookings_partitioned
WHERE start_date BETWEEN '2021-01-01' AND '2021-12-31';
