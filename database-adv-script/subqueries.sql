-- 1. Properties with average rating > 4.0

SELECT
    p.property_id,
    p.name AS property_name,
    p.location
FROM
    properties p
WHERE
    (
        SELECT AVG(r.rating)
        FROM bookings b
        JOIN reviews r ON b.booking_id = r.booking_id
        WHERE b.property_id = p.property_id
    ) > 4.0;


-- 2. Users with more than 3 bookings

SELECT
    u.user_id,
    u.name AS user_name,
    u.email
FROM
    users u
WHERE
    (
        SELECT COUNT(*)
        FROM bookings b
        WHERE b.guest_id = u.user_id
    ) > 3;
