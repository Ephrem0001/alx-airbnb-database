-- INNER JOIN: Bookings with Users

SELECT
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date,
    u.user_id,
    u.name As guest_name,
    u.email
FROM
    booking b
INNER JOIN
    users u
ON
    b.guest_id = u.user_id;


-- LEFT JOIN: Properties with Reviews

SELECT
    p.property_id,
    p.name AS property_name
    p.location,
    r.review_id,
    r.rating,
    r.comment
FROM
    properties
LEFT JOIN
    bookings b on p.property_id = b.property_id
LEFT JOIN
    reviews r ON b.booking_id = r.booking_id;

-- FULL OUTER JOIN: Users and Bookings

SELECT
    u.user_id,
    u.name AS guest_name,
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date
FROM
    users u
FULL OUTER JOIN
    bookings b ON u.user_id = b.guest_id;
