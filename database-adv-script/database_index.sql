-- Measure performance before adding indexes
EXPLAIN ANALYZE SELECT * FROM bookings WHERE user_id = 42;
EXPLAIN ANALYZE SELECT * FROM bookings WHERE property_id = 15;
EXPLAIN ANALYZE SELECT * FROM bookings ORDER BY created_at DESC;

-- Add indexes
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_created_at ON bookings(created_at);

-- Measure performance after adding indexes
EXPLAIN ANALYZE SELECT * FROM bookings WHERE user_id = 42;
EXPLAIN ANALYZE SELECT * FROM bookings WHERE property_id = 15;
EXPLAIN ANALYZE SELECT * FROM bookings ORDER BY created_at DESC;
