-- Index to speed up JOINs with users table
CREATE INDEX idx_users_user_id ON users(user_id);

-- Index to speed up JOINs on bookings.guest_id (linking bookings to users)
CREATE INDEX idx_bookings_guest_id ON bookings(guest_id);

-- Index to speed up JOINs on bookings.property_id (linking bookings to properties)
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Index to improve filtering and ordering by booking start_date
CREATE INDEX idx_bookings_start_date ON bookings(start_date);

-- Index to optimize joins and sorting on properties
CREATE INDEX idx_properties_property_id ON properties(property_id);

-- Optional: If you often filter or order by reviews.rating
-- Uncomment the line below if needed
-- CREATE INDEX idx_reviews_rating ON reviews(rating);
