-- Index to speed up JOINs with users
CREATE INDEX idx_users_user_id ON users(user_id);

-- Index to speed up JOINs with bookings by guest
CREATE INDEX idx_bookings_guest_id ON bookings(guest_id);

-- Index to speed up JOINs with bookings by property
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Index to speed up filtering and ordering by start_date
CREATE INDEX idx_bookings_start_date ON bookings(start_date);

-- Index to speed up JOINs with properties
CREATE INDEX idx_properties_property_id ON properties(property_id);
