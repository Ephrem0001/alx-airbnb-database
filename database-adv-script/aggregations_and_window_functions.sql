-- 1. Total number of bookings per user
SELECT
    u.user_id,
    u.name AS user_name,
    COUNT(b.booking_id) AS total_bookings
FROM
    users u
LEFT JOIN
    bookings b ON u.user_id = b.guest_id
GROUP BY
    u.user_id,
    u.name
ORDER BY
    total_bookings DESC;


-- 2. Rank properties by total number of bookings
SELECT
    property_id,
    total_bookings,
    RANK() OVER (ORDER BY total_bookings DESC) AS booking_rank
FROM
    (
        SELECT
            p.property_id,
            COUNT(b.booking_id) AS total_bookings
        FROM
            properties p
        LEFT JOIN
            bookings b ON p.property_id = b.property_id
        GROUP BY
            p.property_id
    ) AS booking_counts
ORDER BY
    booking_rank;
