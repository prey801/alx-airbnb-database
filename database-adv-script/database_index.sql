CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_created_at ON bookings(created_at);

EXPLAIN SELECT * FROM bookings WHERE user_id = 42;
EXPLAIN SELECT * FROM bookings WHERE property_id = 15;
EXPLAIN SELECT * FROM bookings ORDER BY created_at DESC;
