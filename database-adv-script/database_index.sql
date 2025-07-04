-- Measure performance BEFORE indexes
EXPLAIN ANALYZE
SELECT
    b.booking_id,
    b.start_date,
    u.name
FROM
    bookings b
JOIN
    users u ON b.guest_id = u.user_id
WHERE
    b.start_date >= '2023-01-01'
ORDER BY
    b.start_date;

-- Create indexes to optimize queries

-- Index for users.user_id
CREATE INDEX idx_users_user_id ON users(user_id);

-- Index for bookings.guest_id
CREATE INDEX idx_bookings_guest_id ON bookings(guest_id);

-- Index for bookings.property_id
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Index for bookings.start_date
CREATE INDEX idx_bookings_start_date ON bookings(start_date);

-- Index for properties.property_id
CREATE INDEX idx_properties_property_id ON properties(property_id);

-- Measure performance AFTER indexes
EXPLAIN ANALYZE
SELECT
    b.booking_id,
    b.start_date,
    u.name
FROM
    bookings b
JOIN
    users u ON b.guest_id = u.user_id
WHERE
    b.start_date >= '2023-01-01'
ORDER BY
    b.start_date;
